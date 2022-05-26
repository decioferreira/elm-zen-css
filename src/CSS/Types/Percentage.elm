module CSS.Types.Percentage exposing (Percentage(..), toString)

{-| The <percentage> CSS data type represents a percentage value. It is often
used to define a size as relative to an element's parent object. Numerous
properties can use percentages, such as width, height, margin, padding, and
font-size.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/percentage>

@docs Percentage, toString

-}


{-| <percentage> data type.
-}
type Percentage
    = Percentage Float


{-| -}
toString : Percentage -> String
toString (Percentage value) =
    String.fromFloat value ++ "%"
