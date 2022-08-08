module CSS.Types.Position exposing
    ( Position(..), toString
    , Horizontal(..), Vertical(..)
    )

{-| The <time> CSS data type represents a time value expressed in seconds or milliseconds.
It is used in animation, transition, and related properties.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/position_value>

@docs Position, toString
@docs Horizontal, Vertical

-}

import CSS.Types.LengthPercentage as LengthPercentage exposing (LengthPercentage)


{-| <position> data type.
-}
type Position
    = LeftTop
    | CenterTop
    | RightTop
    | LeftCenter
    | Center
    | RightCenter
    | LeftBottom
    | CenterBottom
    | RightBottom
    | XAxis LengthPercentage
    | BothAxis ( Horizontal, LengthPercentage ) ( Vertical, LengthPercentage )


{-| -}
type Horizontal
    = Left
    | Right


horizontalToString : Horizontal -> String
horizontalToString horizontal =
    case horizontal of
        Left ->
            "left"

        Right ->
            "right"


{-| -}
type Vertical
    = Top
    | Bottom


verticalToString : Vertical -> String
verticalToString vertical =
    case vertical of
        Top ->
            "top"

        Bottom ->
            "bottom"


{-| -}
toString : Position -> String
toString position =
    case position of
        LeftTop ->
            "left top"

        CenterTop ->
            "top"

        RightTop ->
            "right top"

        LeftCenter ->
            "left"

        Center ->
            "center"

        RightCenter ->
            "right"

        LeftBottom ->
            "left bottom"

        CenterBottom ->
            "bottom"

        RightBottom ->
            "right bottom"

        XAxis lengthPercentage ->
            LengthPercentage.toString lengthPercentage

        BothAxis ( horizontal, horizontalLengthPercentage ) ( vertical, verticalLengthPercentage ) ->
            horizontalToString horizontal
                ++ " "
                ++ LengthPercentage.toString horizontalLengthPercentage
                ++ " "
                ++ verticalToString vertical
                ++ " "
                ++ LengthPercentage.toString verticalLengthPercentage
