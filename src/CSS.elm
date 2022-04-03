module CSS exposing
    ( CSS(..), css, toString
    , class
    , Variable, variable, var
    )

{-|


# Definition

@docs CSS, css, toString


# Attributes

@docs class


# Variables

@docs Variable, variable, var

-}

import Html
import Html.Attributes as Attributes



-- Definitions


type CSS
    = CSS
        { className : String
        , properties : List ( String, String )
        , pseudoClasses : List ( String, CSS -> CSS )
        }


css : String -> CSS
css className =
    CSS
        { className = className
        , properties = []
        , pseudoClasses = []
        }


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



-- Attributes


class : CSS -> Html.Attribute msg
class (CSS { className }) =
    Attributes.class className



-- Variables


type Variable
    = Variable String String


variable : String -> String -> Variable
variable =
    Variable


var : Variable -> String
var (Variable name _) =
    "var(--" ++ name ++ ")"
