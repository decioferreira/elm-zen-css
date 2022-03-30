module SourceToProd exposing (sourceToProd)

import Elm.Parser
import Elm.Processing
import Elm.Syntax.Declaration as Declaration exposing (Declaration)
import Elm.Syntax.Expression as Expression exposing (Expression)
import Elm.Syntax.Infix as Infix
import Elm.Syntax.Module as Module
import Elm.Syntax.Node exposing (Node(..))
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
                                        Node range (Module.NormalModule { defaultModuleData | moduleName = Helpers.node data.name })

                                    Node range (Module.PortModule defaultModuleData) ->
                                        Node range (Module.PortModule { defaultModuleData | moduleName = Helpers.node data.name })

                                    Node range (Module.EffectModule effectModuleData) ->
                                        Node range (Module.EffectModule { effectModuleData | moduleName = Helpers.node data.name })
                            , declarations =
                                file.declarations
                                    |> List.filterMap
                                        (\declaration ->
                                            case declaration of
                                                Node _ (Declaration.FunctionDeclaration function) ->
                                                    case function.signature of
                                                        Just (Node _ signature) ->
                                                            case signature.typeAnnotation of
                                                                Node _ (TypeAnnotation.Typed (Node _ ( [], "CSS" )) []) ->
                                                                    Just (cssOnly function)

                                                                Node _ (TypeAnnotation.Typed (Node _ ( [ "CSS" ], "CSS" )) []) ->
                                                                    Just (cssOnly function)

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


cssOnly : Expression.Function -> Node Declaration
cssOnly function =
    Helpers.node
        (Declaration.FunctionDeclaration
            { function
                | declaration =
                    case function.declaration of
                        Node _ functionImplementation ->
                            Helpers.node { functionImplementation | expression = extractNestedNode functionImplementation.expression }
            }
        )


extractNestedNode : Node Expression -> Node Expression
extractNestedNode nodeExpression =
    case nodeExpression of
        Node _ (Expression.OperatorApplication "|>" Infix.Left leftNode _) ->
            extractNestedNode leftNode

        _ ->
            nodeExpression
