port module Main exposing (main)

import Elm.Parser
import Elm.Processing
import Elm.Syntax.Declaration as Declaration
import Elm.Syntax.Exposing as Exposing
import Elm.Syntax.Expression as Expression
import Elm.Syntax.Module as Module
import Elm.Syntax.Node as Node exposing (Node(..))
import Elm.Syntax.Pattern as Pattern
import Elm.Syntax.TypeAnnotation as TypeAnnotation
import Elm.Writer


port sendMessage : String -> Cmd msg


port messageReceiver : (String -> msg) -> Sub msg


main : Program () () String
main =
    Platform.worker
        { init = \_ -> ( (), Cmd.none )
        , update = \src model -> ( model, sendMessage (parse src) )
        , subscriptions = \_ -> messageReceiver identity
        }


node : a -> Node a
node =
    Node
        { end = { column = 0, row = 0 }
        , start = { column = 0, row = 0 }
        }


parse : String -> String
parse input =
    let
        code =
            input
                |> Elm.Parser.parse
                |> Result.map
                    (Elm.Processing.process Elm.Processing.init
                        >> (\file ->
                                { file
                                    | moduleDefinition =
                                        case file.moduleDefinition of
                                            Node range (Module.NormalModule defaultModuleData) ->
                                                Node range
                                                    (Module.PortModule
                                                        { defaultModuleData
                                                            | exposingList = node (Exposing.Explicit [ node (Exposing.FunctionExpose "main") ])
                                                        }
                                                    )

                                            Node range (Module.PortModule defaultModuleData) ->
                                                Node range
                                                    (Module.PortModule
                                                        { defaultModuleData
                                                            | exposingList = node (Exposing.Explicit [ node (Exposing.FunctionExpose "main") ])
                                                        }
                                                    )

                                            _ ->
                                                file.moduleDefinition
                                    , declarations =
                                        sendMessageDeclaration
                                            :: messageReceiverDeclaration
                                            :: mainDeclaration file.declarations
                                            :: file.declarations
                                }
                           )
                        >> Elm.Writer.writeFile
                        >> Elm.Writer.write
                    )
    in
    case code of
        Err e ->
            Debug.toString e

        Ok v ->
            v


sendMessageDeclaration : Node Declaration.Declaration
sendMessageDeclaration =
    node
        (Declaration.PortDeclaration
            { name = node "sendMessage"
            , typeAnnotation =
                node
                    (TypeAnnotation.FunctionTypeAnnotation
                        (node (TypeAnnotation.Typed (node ( [], "String" )) []))
                        (node (TypeAnnotation.Typed (node ( [], "Cmd" )) [ node (TypeAnnotation.GenericType "msg") ]))
                    )
            }
        )


messageReceiverDeclaration : Node Declaration.Declaration
messageReceiverDeclaration =
    node
        (Declaration.PortDeclaration
            { name = node "messageReceiver"
            , typeAnnotation =
                node
                    (TypeAnnotation.FunctionTypeAnnotation
                        (node
                            (TypeAnnotation.FunctionTypeAnnotation (node TypeAnnotation.Unit)
                                (node (TypeAnnotation.GenericType "msg"))
                            )
                        )
                        (node (TypeAnnotation.Typed (node ( [], "Sub" )) [ node (TypeAnnotation.GenericType "msg") ]))
                    )
            }
        )


mainDeclaration : List (Node Declaration.Declaration) -> Node Declaration.Declaration
mainDeclaration declarations =
    let
        classDeclarations =
            List.filterMap
                (\declaration ->
                    case declaration of
                        Node _ (Declaration.FunctionDeclaration functionDeclaration) ->
                            functionDeclaration.declaration
                                |> Node.value
                                |> .name
                                |> Node.value
                                |> Expression.FunctionOrValue []
                                |> node
                                |> Just

                        _ ->
                            Nothing
                )
                declarations
    in
    node
        (Declaration.FunctionDeclaration
            { declaration =
                node
                    { arguments = []
                    , expression =
                        node
                            (Expression.Application
                                [ node (Expression.FunctionOrValue [ "Platform" ] "worker")
                                , node
                                    (Expression.RecordExpr
                                        [ node
                                            ( node "init"
                                            , node
                                                (Expression.LambdaExpression
                                                    { args = [ node Pattern.AllPattern ]
                                                    , expression =
                                                        node
                                                            (Expression.TupledExpression
                                                                [ node Expression.UnitExpr
                                                                , node (Expression.FunctionOrValue [ "Cmd" ] "none")
                                                                ]
                                                            )
                                                    }
                                                )
                                            )
                                        , node
                                            ( node "update"
                                            , node
                                                (Expression.LambdaExpression
                                                    { args = [ node Pattern.AllPattern, node Pattern.AllPattern ]
                                                    , expression =
                                                        node
                                                            (Expression.TupledExpression
                                                                [ node Expression.UnitExpr
                                                                , node
                                                                    (Expression.Application
                                                                        [ node (Expression.FunctionOrValue [] "sendMessage")
                                                                        , node
                                                                            (Expression.ParenthesizedExpression
                                                                                (node
                                                                                    (Expression.Application
                                                                                        [ node (Expression.FunctionOrValue [ "CSS" ] "toString")
                                                                                        , node (Expression.ListExpr classDeclarations)
                                                                                        ]
                                                                                    )
                                                                                )
                                                                            )
                                                                        ]
                                                                    )
                                                                ]
                                                            )
                                                    }
                                                )
                                            )
                                        , node
                                            ( node "subscriptions"
                                            , node
                                                (Expression.LambdaExpression
                                                    { args = [ node Pattern.AllPattern ]
                                                    , expression =
                                                        node
                                                            (Expression.Application
                                                                [ node (Expression.FunctionOrValue [] "messageReceiver")
                                                                , node
                                                                    (Expression.ParenthesizedExpression
                                                                        (node
                                                                            (Expression.LambdaExpression
                                                                                { args = [ node Pattern.AllPattern ]
                                                                                , expression = node Expression.UnitExpr
                                                                                }
                                                                            )
                                                                        )
                                                                    )
                                                                ]
                                                            )
                                                    }
                                                )
                                            )
                                        ]
                                    )
                                ]
                            )
                    , name = node "main"
                    }
            , documentation = Nothing
            , signature =
                Just
                    (node
                        { name = node "main"
                        , typeAnnotation =
                            node
                                (TypeAnnotation.Typed (node ( [], "Program" ))
                                    [ node TypeAnnotation.Unit
                                    , node TypeAnnotation.Unit
                                    , node TypeAnnotation.Unit
                                    ]
                                )
                        }
                    )
            }
        )
