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
                                        let
                                            (Node moduleNameRange _) =
                                                defaultModuleData.moduleName
                                        in
                                        Node range (Module.NormalModule { defaultModuleData | moduleName = Node moduleNameRange data.name })

                                    Node range (Module.PortModule defaultModuleData) ->
                                        let
                                            (Node moduleNameRange _) =
                                                defaultModuleData.moduleName
                                        in
                                        Node range (Module.PortModule { defaultModuleData | moduleName = Node moduleNameRange data.name })

                                    Node range (Module.EffectModule effectModuleData) ->
                                        let
                                            (Node moduleNameRange _) =
                                                effectModuleData.moduleName
                                        in
                                        Node range (Module.EffectModule { effectModuleData | moduleName = Node moduleNameRange data.name })
                            , imports =
                                file.imports
                                    |> List.filter
                                        (\(Node _ { moduleName }) ->
                                            case moduleName of
                                                Node _ ("CSS" :: _ :: _) ->
                                                    False

                                                _ ->
                                                    True
                                        )
                            , declarations =
                                file.declarations
                                    |> List.filterMap
                                        (\declaration ->
                                            case declaration of
                                                Node range (Declaration.FunctionDeclaration function) ->
                                                    case function.signature of
                                                        Just (Node _ signature) ->
                                                            case signature.typeAnnotation of
                                                                Node _ (TypeAnnotation.Typed (Node _ ( [], "CSS" )) []) ->
                                                                    Just (Node range (cssOnly function))

                                                                Node _ (TypeAnnotation.Typed (Node _ ( [ "CSS" ], "CSS" )) []) ->
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
            | declaration =
                case function.declaration of
                    Node range functionImplementation ->
                        Node range { functionImplementation | expression = extractNestedNode functionImplementation.expression }
        }


extractNestedNode : Node Expression -> Node Expression
extractNestedNode nodeExpression =
    case nodeExpression of
        Node _ (Expression.OperatorApplication "|>" Infix.Left leftNode _) ->
            extractNestedNode leftNode

        _ ->
            nodeExpression
