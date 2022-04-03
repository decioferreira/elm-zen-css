module CSS.Property exposing (custom, background, color)

{-|


# Properties

@docs custom, background, color

-}

import CSS exposing (CSS(..))
import Html
import Html.Attributes as Attributes


custom : String -> String -> CSS -> CSS
custom propertyName value (CSS details) =
    CSS { details | properties = ( propertyName, value ) :: details.properties }


background : String -> CSS -> CSS
background =
    custom "background"


color : String -> CSS -> CSS
color =
    custom "color"