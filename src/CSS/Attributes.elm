module CSS.Attributes exposing (class, classList, svgClass)

{-|


# Attributes

@docs class, classList, svgClass

-}

import CSS.Internal exposing (ClassName(..))
import Html
import Html.Attributes as Attributes
import Svg
import Svg.Attributes


{-| HTML class attribute.
-}
class : ClassName -> Html.Attribute msg
class (ClassName name) =
    Attributes.class name


{-| This function makes it easier to build a space-separated class attribute.
Each class can easily be added and removed depending on the boolean value it is
paired with.
-}
classList : List ( ClassName, Bool ) -> Html.Attribute msg
classList classes =
    classes
        |> List.map (Tuple.mapFirst (\(ClassName name) -> name))
        |> Attributes.classList


{-| SVG class attribute.
-}
svgClass : ClassName -> Svg.Attribute msg
svgClass (ClassName name) =
    Svg.Attributes.class name
