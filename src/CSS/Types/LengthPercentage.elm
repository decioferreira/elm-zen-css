module CSS.Types.LengthPercentage exposing (LengthPercentage(..), toString)

{-| The <length-percentage> CSS data type represents a value that can be either a <length> or a
<percentage>.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/length-percentage>

@docs LengthPercentage, toString

-}

import CSS.Types.Length
import CSS.Types.Percentage


{-| <length-percentage> data type.
-}
type LengthPercentage
    = Length CSS.Types.Length.Length
    | Percentage CSS.Types.Percentage.Percentage


{-| -}
toString : LengthPercentage -> String
toString lengthPercentage =
    case lengthPercentage of
        Length length ->
            CSS.Types.Length.toString length

        Percentage percentage ->
            CSS.Types.Percentage.toString percentage
