module CSS.Attributes exposing (class, classList)

{-|


# Attributes

@docs class, classList

-}

import CSS.Internal exposing (CSS(..))
import Html
import Html.Attributes as Attributes


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
