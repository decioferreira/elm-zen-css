module CSS exposing
    ( CSS, css, toString
    , class
    , custom, background, color
    )

{-|


# Definition

@docs CSS, css, toString


# Attributes

@docs class


# Properties

@docs custom, background, color

-}

import Html
import Html.Attributes as Attributes



-- Definitions


type CSS
    = CSS String (List ( String, String ))


css : String -> CSS
css className =
    CSS className []


toString : List CSS -> String
toString =
    List.map
        (\(CSS className properties) ->
            "."
                ++ className
                ++ " {"
                ++ (properties
                        |> List.map propertyToString
                        |> String.join "; "
                   )
                ++ "}"
        )
        >> String.join "\n"


propertyToString : ( String, String ) -> String
propertyToString ( propertyName, value ) =
    propertyName ++ ": " ++ value



-- Attributes


class : CSS -> Html.Attribute msg
class (CSS className _) =
    Attributes.class className



-- Properties


custom : String -> String -> CSS -> CSS
custom propertyName value (CSS className properties) =
    CSS className (( propertyName, value ) :: properties)


background : String -> CSS -> CSS
background value (CSS className properties) =
    CSS className (( "background", value ) :: properties)


color : String -> CSS -> CSS
color value (CSS className properties) =
    CSS className (( "color", value ) :: properties)
