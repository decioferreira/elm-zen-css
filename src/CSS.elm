module CSS exposing (CSS, background, class, color, css, toString)

import Html
import Html.Attributes as Attributes


type CSS
    = CSS String (List ( String, String ))


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


css : String -> CSS
css className =
    CSS className []


class : CSS -> Html.Attribute msg
class (CSS className _) =
    Attributes.class className


background : String -> CSS -> CSS
background value (CSS className properties) =
    CSS className (( "background", value ) :: properties)


color : String -> CSS -> CSS
color value (CSS className properties) =
    CSS className (( "color", value ) :: properties)
