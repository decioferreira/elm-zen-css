module CSS.Attributes exposing (class, classList, svgClass)

{-|


# Attributes

@docs class, classList, svgClass

-}

import CSS.Internal exposing (CSS(..))
import Html
import Html.Attributes as Attributes
import Svg
import Svg.Attributes


{-| HTML class attribute.
-}
class : CSS -> Html.Attribute msg
class (CSS { className }) =
    Attributes.class className


{-| This function makes it easier to build a space-separated class attribute.
Each class can easily be added and removed depending on the boolean value it is
paired with.
-}
classList : List ( CSS, Bool ) -> Html.Attribute msg
classList classes =
    classes
        |> List.map (Tuple.mapFirst (\(CSS { className }) -> className))
        |> Attributes.classList


{-| SVG class attribute.
-}
svgClass : CSS -> Svg.Attribute msg
svgClass (CSS { className }) =
    Svg.Attributes.class className
