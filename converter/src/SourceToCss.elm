module SourceToCss exposing (sourceToCss)

import Elm.Parser
import Elm.Processing
import Elm.Syntax.Declaration as Declaration exposing (Declaration)
import Elm.Syntax.Exposing as Exposing
import Elm.Syntax.Expression as Expression exposing (Expression)
import Elm.Syntax.Module as Module
import Elm.Syntax.Node as Node exposing (Node(..))
import Elm.Syntax.Pattern as Pattern
import Elm.Syntax.TypeAnnotation as TypeAnnotation
import Elm.Writer
import Helpers exposing (node)
import Result.Extra as Result


sourceToCss : String -> String
sourceToCss =
    Elm.Parser.parse
        >> Result.map
            (Elm.Processing.process Elm.Processing.init
                >> (\file ->
                        { file
                            | moduleDefinition =
                                case file.moduleDefinition of
                                    Node range (Module.EffectModule effectModuleData) ->
                                        Node range
                                            (Module.EffectModule
                                                { effectModuleData
                                                    | moduleName = node [ "ExportCss" ]
                                                    , exposingList = node (Exposing.Explicit [ node (Exposing.FunctionExpose "main") ])
                                                }
                                            )

                                    Node range _ ->
                                        Node range
                                            (Module.PortModule
                                                { moduleName = node [ "ExportCss" ]
                                                , exposingList = node (Exposing.Explicit [ node (Exposing.FunctionExpose "main") ])
                                                }
                                            )
                            , imports =
                                node { exposingList = Nothing, moduleAlias = Nothing, moduleName = node [ "CSS", "Internal" ] }
                                    :: file.imports
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
        >> Result.extract (always "There was an error!")


sendMessageDeclaration : Node Declaration
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


messageReceiverDeclaration : Node Declaration
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


mainDeclaration : List (Node Declaration) -> Node Declaration
mainDeclaration declarations =
    let
        classDeclarations =
            List.filterMap
                (\declaration ->
                    case declaration of
                        Node _ (Declaration.FunctionDeclaration functionDeclaration) ->
                            case functionDeclaration.signature of
                                Just (Node _ signature) ->
                                    case signature.typeAnnotation of
                                        Node _ (TypeAnnotation.Typed (Node _ ( [], "Class" )) []) ->
                                            Just (declarationHelper functionDeclaration)

                                        Node _ (TypeAnnotation.Typed (Node _ ( [ "CSS" ], "Class" )) []) ->
                                            Just (declarationHelper functionDeclaration)

                                        _ ->
                                            Nothing

                                _ ->
                                    Nothing

                        _ ->
                            Nothing
                )
                declarations

        keyframeDeclarations =
            List.filterMap
                (\declaration ->
                    case declaration of
                        Node _ (Declaration.FunctionDeclaration functionDeclaration) ->
                            case functionDeclaration.signature of
                                Just (Node _ signature) ->
                                    case signature.typeAnnotation of
                                        Node _ (TypeAnnotation.Typed (Node _ ( [], "Keyframe" )) []) ->
                                            Just (declarationHelper functionDeclaration)

                                        Node _ (TypeAnnotation.Typed (Node _ ( [ "CSS" ], "Keyframe" )) []) ->
                                            Just (declarationHelper functionDeclaration)

                                        _ ->
                                            Nothing

                                _ ->
                                    Nothing

                        _ ->
                            Nothing
                )
                declarations

        variableDeclarations =
            List.filterMap
                (\declaration ->
                    case declaration of
                        Node _ (Declaration.FunctionDeclaration functionDeclaration) ->
                            case functionDeclaration.signature of
                                Just (Node _ signature) ->
                                    case signature.typeAnnotation of
                                        Node _ (TypeAnnotation.Typed (Node _ ( [], "Variable" )) []) ->
                                            Just (declarationHelper functionDeclaration)

                                        Node _ (TypeAnnotation.Typed (Node _ ( [ "CSS" ], "Variable" )) []) ->
                                            Just (declarationHelper functionDeclaration)

                                        _ ->
                                            Nothing

                                _ ->
                                    Nothing

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
                                                                                        [ node (Expression.FunctionOrValue [ "CSS", "Internal" ] "toString")
                                                                                        , node
                                                                                            (Expression.RecordExpr
                                                                                                [ node
                                                                                                    ( node "classes"
                                                                                                    , node (Expression.ListExpr classDeclarations)
                                                                                                    )
                                                                                                , node
                                                                                                    ( node "keyframes"
                                                                                                    , node (Expression.ListExpr keyframeDeclarations)
                                                                                                    )
                                                                                                , node
                                                                                                    ( node "variables"
                                                                                                    , node (Expression.ListExpr variableDeclarations)
                                                                                                    )
                                                                                                ]
                                                                                            )
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


declarationHelper : Expression.Function -> Node Expression
declarationHelper functionDeclaration =
    functionDeclaration.declaration
        |> Node.value
        |> .name
        |> Node.value
        |> Expression.FunctionOrValue []
        |> node
