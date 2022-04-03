module CSS.Attributes exposing (class, classList)

{-|


# Attributes

@docs class, classList

-}

import CSS.Internal exposing (CSS(..))
import Html
import Html.Attributes as Attributes


class : CSS -> Html.Attribute msg
class (CSS { className }) =
    Attributes.class className


classList : List ( CSS, Bool ) -> Html.Attribute msg
classList classes =
    classes
        |> List.map (Tuple.mapFirst (\(CSS { className }) -> className))
        |> Attributes.classList
