module SourceToProd exposing (sourceToProd)

import Elm.Parser
import Elm.Processing
import Elm.Syntax.Declaration as Declaration exposing (Declaration)
import Elm.Syntax.Exposing as Exposing
import Elm.Syntax.Expression as Expression exposing (Expression)
import Elm.Syntax.Infix as Infix
import Elm.Syntax.Module as Module
import Elm.Syntax.Node exposing (Node(..))
import Elm.Syntax.Range as Range
import Elm.Syntax.TypeAnnotation as TypeAnnotation
import Elm.Writer
import Helpers
import Result.Extra as Result


sourceToProd : Helpers.ProdData -> String
sourceToProd data =
    Elm.Parser.parse data.src
        |> Result.map
            (Elm.Processing.process Elm.Processing.init
                >> (\file ->
                        { file
                            | moduleDefinition =
                                case file.moduleDefinition of
                                    Node range (Module.NormalModule defaultModuleData) ->
                                        Node range
                                            (Module.NormalModule
                                                { defaultModuleData
                                                    | moduleName = Node Range.emptyRange data.name
                                                    , exposingList =
                                                        case defaultModuleData.exposingList of
                                                            Node _ (Exposing.Explicit exposedList) ->
                                                                Node Range.emptyRange
                                                                    (Exposing.Explicit
                                                                        (exposedList
                                                                            |> List.map (\(Node _ topLevelExpose) -> Node Range.emptyRange topLevelExpose)
                                                                        )
                                                                    )

                                                            _ ->
                                                                defaultModuleData.exposingList
                                                }
                                            )

                                    Node range (Module.PortModule defaultModuleData) ->
                                        Node range
                                            (Module.PortModule
                                                { defaultModuleData
                                                    | moduleName = Node Range.emptyRange data.name
                                                }
                                            )

                                    Node range (Module.EffectModule effectModuleData) ->
                                        Node range
                                            (Module.EffectModule
                                                { effectModuleData
                                                    | moduleName = Node Range.emptyRange data.name
                                                }
                                            )
                            , imports =
                                [ Node Range.emptyRange
                                    { exposingList = Nothing
                                    , moduleAlias = Nothing
                                    , moduleName = Node Range.emptyRange [ "CSS" ]
                                    }
                                ]
                            , declarations =
                                file.declarations
                                    |> List.filterMap
                                        (\declaration ->
                                            case declaration of
                                                Node range (Declaration.FunctionDeclaration function) ->
                                                    case function.signature of
                                                        Just (Node _ signature) ->
                                                            case signature.typeAnnotation of
                                                                Node _ (TypeAnnotation.Typed (Node _ ( [], "Class" )) []) ->
                                                                    Just (Node range (cssOnly function))

                                                                Node _ (TypeAnnotation.Typed (Node _ ( [ "CSS" ], "Class" )) []) ->
                                                                    Just (Node range (cssOnly function))

                                                                _ ->
                                                                    Nothing

                                                        _ ->
                                                            Nothing

                                                _ ->
                                                    Nothing
                                        )
                        }
                   )
                >> Elm.Writer.writeFile
                >> Elm.Writer.write
            )
        |> Result.extract (always "There was an error!")


cssOnly : Expression.Function -> Declaration
cssOnly function =
    Declaration.FunctionDeclaration
        { function
            | signature =
                function.signature
                    |> Maybe.map
                        (\(Node range signature) ->
                            Node range
                                { signature
                                    | typeAnnotation =
                                        Node Range.emptyRange
                                            (TypeAnnotation.Typed
                                                (Node Range.emptyRange ( [ "CSS" ], "ClassName" ))
                                                []
                                            )
                                }
                        )
            , declaration =
                case function.declaration of
                    Node range functionImplementation ->
                        Node range { functionImplementation | expression = extractNestedNode functionImplementation.expression }
        }


extractNestedNode : Node Expression -> Node Expression
extractNestedNode nodeExpression =
    case nodeExpression of
        Node _ (Expression.OperatorApplication "|>" Infix.Left leftNode _) ->
            extractNestedNode leftNode

        Node range (Expression.Application ((Node functionRange (Expression.FunctionOrValue [ "CSS" ] "class")) :: (Node nameRange (Expression.Literal className)) :: _)) ->
            Node range
                (Expression.Application
                    [ Node functionRange (Expression.FunctionOrValue [ "CSS" ] "className")
                    , Node nameRange (Expression.Literal className)
                    ]
                )

        _ ->
            nodeExpression
