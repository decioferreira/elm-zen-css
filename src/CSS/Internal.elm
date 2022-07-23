module CSS.Internal exposing
    ( Variable(..), Class(..), ClassName(..), Property, AtRule(..), Keyframe(..)
    , toString
    )

{-|


# Definition

@docs Variable, Class, ClassName, Property, AtRule, Keyframe


# To String

@docs toString

-}

-- DEFINITION


type Variable
    = Variable String String


type Class
    = Class
        { name : String
        , properties : List Property
        , pseudoClasses : List ( String, List Property )
        , pseudoElements : List ( String, List Property )
        , atRules : List AtRule
        }


type ClassName
    = ClassName String


type alias Property =
    ( String, String )


type AtRule
    = AtRuleMedia
        { rule : String
        , properties : List Property
        }


type Keyframe
    = Keyframe
        { identifier : String
        , values : List { selector : String, properties : List Property }
        }



-- TO STRING


toString :
    { classes : List Class
    , keyframes : List Keyframe
    , variables : List Variable
    }
    -> String
toString info =
    (case info.variables of
        [] ->
            ""

        variables ->
            ":root {"
                ++ (List.map variableToString variables
                        |> String.join "; "
                   )
                ++ "}\n"
    )
        ++ (List.map keyframeToString info.keyframes
                |> String.join "\n"
           )
        ++ (List.map classToString info.classes
                |> String.join "\n"
           )


variableToString : Variable -> String
variableToString (Variable name value) =
    "--" ++ name ++ ": " ++ value


keyframeToString : Keyframe -> String
keyframeToString (Keyframe info) =
    "@keyframes "
        ++ info.identifier
        ++ " {"
        ++ (info.values
                |> List.map
                    (\value ->
                        styleRule value.selector value.properties
                    )
                |> String.join " "
           )
        ++ "}\n"


classToString : Class -> String
classToString (Class details) =
    styleRule ("." ++ details.name) details.properties
        ++ (details.pseudoClasses
                |> List.map (pseudoClassToString details.name)
                |> String.join ""
           )
        ++ (details.pseudoElements
                |> List.map (pseudoElementToString details.name)
                |> String.join ""
           )
        ++ (details.atRules
                |> List.map (atRuleToString details.name)
                |> String.join ""
           )


pseudoClassToString : String -> ( String, List ( String, String ) ) -> String
pseudoClassToString className ( pseudoClassName, properties ) =
    "\n" ++ styleRule ("." ++ className ++ ":" ++ pseudoClassName) properties


pseudoElementToString : String -> ( String, List ( String, String ) ) -> String
pseudoElementToString className ( pseudoElementName, properties ) =
    "\n" ++ styleRule ("." ++ className ++ "::" ++ pseudoElementName) properties


atRuleToString : String -> AtRule -> String
atRuleToString className atRule =
    case atRule of
        AtRuleMedia { rule, properties } ->
            "\n@media "
                ++ rule
                ++ " {"
                ++ styleRule ("." ++ className) properties
                ++ "}"



-- HELPERS


styleRule : String -> List ( String, String ) -> String
styleRule selectors properties =
    selectors
        ++ " {"
        ++ (properties
                |> List.map propertyToString
                |> String.join ";"
           )
        ++ "}"


propertyToString : ( String, String ) -> String
propertyToString ( propertyName, value ) =
    propertyName ++ ": " ++ value
