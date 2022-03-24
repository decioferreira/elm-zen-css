port module Main exposing (convertToCss, convertToProd, main, resultCss, resultProd)

import Elm.Parser
import Elm.Processing
import Elm.Syntax.Declaration as Declaration exposing (Declaration)
import Elm.Syntax.Exposing as Exposing
import Elm.Syntax.Expression as Expression exposing (Expression)
import Elm.Syntax.Infix as Infix
import Elm.Syntax.Module as Module
import Elm.Syntax.Node as Node exposing (Node(..))
import Elm.Syntax.Pattern as Pattern
import Elm.Syntax.TypeAnnotation as TypeAnnotation
import Elm.Writer
import Result.Extra as Result



-- PORTS


port convertToCss : (String -> msg) -> Sub msg


port resultCss : String -> Cmd msg


port convertToProd : (ProdData -> msg) -> Sub msg


port resultProd : String -> Cmd msg



-- MAIN


main : Program Flags Model Msg
main =
    Platform.worker
        { init = init
        , update = update
        , subscriptions = subscriptions
        }


type alias Flags =
    ()



-- MODEL


type alias Model =
    ()


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( (), Cmd.none )



-- UPDATE


type Msg
    = ConvertToCss String
    | ConvertToProd ProdData


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ConvertToCss src ->
            ( model, resultCss (toCss src) )

        ConvertToProd data ->
            ( model, resultProd (toProd data) )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ convertToCss ConvertToCss
        , convertToProd ConvertToProd
        ]



-- TO CSS


toCss : String -> String
toCss =
    Elm.Parser.parse
        >> Result.map
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



-- TO PRODUCTION


type alias ProdData =
    { name : List String, src : String }


toProd : ProdData -> String
toProd data =
    Elm.Parser.parse data.src
        |> Result.map
            (Elm.Processing.process Elm.Processing.init
                >> (\file ->
                        { file
                            | moduleDefinition =
                                case file.moduleDefinition of
                                    Node range (Module.NormalModule defaultModuleData) ->
                                        Node range (Module.NormalModule { defaultModuleData | moduleName = node data.name })

                                    Node range (Module.PortModule defaultModuleData) ->
                                        Node range (Module.PortModule { defaultModuleData | moduleName = node data.name })

                                    Node range (Module.EffectModule effectModuleData) ->
                                        Node range (Module.EffectModule { effectModuleData | moduleName = node data.name })
                            , declarations =
                                file.declarations
                                    |> List.map
                                        (\declaration ->
                                            case declaration of
                                                Node _ (Declaration.FunctionDeclaration function) ->
                                                    node
                                                        (Declaration.FunctionDeclaration
                                                            { function
                                                                | declaration =
                                                                    case function.declaration of
                                                                        Node _ functionImplementation ->
                                                                            node { functionImplementation | expression = extractNestedNode functionImplementation.expression }
                                                            }
                                                        )

                                                _ ->
                                                    declaration
                                        )
                        }
                   )
                >> Elm.Writer.writeFile
                >> Elm.Writer.write
            )
        |> Result.extract (always "There was an error!")



-- HELPERS


node : a -> Node a
node =
    Node
        { end = { column = 0, row = 0 }
        , start = { column = 0, row = 0 }
        }


extractNestedNode : Node Expression -> Node Expression
extractNestedNode nodeExpression =
    case nodeExpression of
        Node _ (Expression.OperatorApplication "|>" Infix.Left leftNode rightNode) ->
            extractNestedNode leftNode

        _ ->
            nodeExpression
