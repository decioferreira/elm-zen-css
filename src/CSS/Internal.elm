module CSS.Internal exposing
    ( CSS(..)
    , css
    , toString
    )

{-|


# Definition

@docs CSS


# Methods

@docs css


# To String

@docs toString

-}

import CSS.Variables.Internal exposing (Variable(..))



-- Definition


type CSS
    = CSS
        { className : String
        , properties : List ( String, String )
        , pseudoClasses : List ( String, CSS -> CSS )
        , pseudoElements : List ( String, CSS -> CSS )
        , descendantClasses : List ( String, CSS -> CSS )
        , atRules : List ( String, String, CSS -> CSS )
        }



-- Methods


css : String -> CSS
css className =
    CSS
        { className = className
        , properties = []
        , pseudoClasses = []
        , pseudoElements = []
        , descendantClasses = []
        , atRules = []
        }



-- To String


toString : List Variable -> List CSS -> String
toString variables classes =
    (case variables of
        [] ->
            ""

        _ ->
            ":root {"
                ++ (List.map
                        (\(Variable name value) ->
                            "--" ++ name ++ ": " ++ value
                        )
                        variables
                        |> String.join "; "
                   )
                ++ "}\n"
    )
        ++ (List.map cssToString classes
                |> String.join "\n"
           )


cssToString : CSS -> String
cssToString (CSS details) =
    "."
        ++ details.className
        ++ " {"
        ++ (details.properties
                |> List.map propertyToString
                |> String.join "; "
           )
        ++ "}"
        ++ (details.pseudoClasses
                |> List.map (pseudoClassToString details.className)
                |> String.join ""
           )
        ++ (details.pseudoElements
                |> List.map (pseudoElementToString details.className)
                |> String.join ""
           )
        ++ (details.descendantClasses
                |> List.map (descendantClassToString details.className)
                |> String.join ""
           )
        ++ (details.atRules
                |> List.map (atRuleToString details.className)
                |> String.join ""
           )


propertyToString : ( String, String ) -> String
propertyToString ( propertyName, value ) =
    propertyName ++ ": " ++ value


pseudoClassToString : String -> ( String, CSS -> CSS ) -> String
pseudoClassToString className ( pseudoClassName, mapper ) =
    "\n"
        ++ (css (className ++ ":" ++ pseudoClassName)
                |> mapper
                |> cssToString
           )


pseudoElementToString : String -> ( String, CSS -> CSS ) -> String
pseudoElementToString className ( pseudoElementName, mapper ) =
    "\n"
        ++ (css (className ++ "::" ++ pseudoElementName)
                |> mapper
                |> cssToString
           )


descendantClassToString : String -> ( String, CSS -> CSS ) -> String
descendantClassToString className ( descendantClassName, mapper ) =
    "\n"
        ++ (css (className ++ " ." ++ descendantClassName)
                |> mapper
                |> cssToString
           )


atRuleToString : String -> ( String, String, CSS -> CSS ) -> String
atRuleToString className ( identifier, rule, mapper ) =
    "\n@"
        ++ identifier
        ++ " "
        ++ rule
        ++ " {"
        ++ (css className
                |> mapper
                |> cssToString
           )
        ++ "}"
