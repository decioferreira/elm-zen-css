module CSS.Types.Position exposing
    ( Position(..), toString
    , Value(..), Horizontal(..), Vertical(..)
    )

{-| The <time> CSS data type represents a time value expressed in seconds or milliseconds.
It is used in animation, transition, and related properties.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/position_value>

@docs Position, toString
@docs Value, Horizontal, Vertical

-}

import CSS.Types.Length
import CSS.Types.Percentage


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
    | XAxis Value
    | BothAxis ( Horizontal, Value ) ( Vertical, Value )


{-| -}
type Value
    = Percentage CSS.Types.Percentage.Percentage
    | Length CSS.Types.Length.Length


valueToString : Value -> String
valueToString value =
    case value of
        Percentage percentage ->
            CSS.Types.Percentage.toString percentage

        Length length ->
            CSS.Types.Length.toString length


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

        XAxis value ->
            valueToString value

        BothAxis ( horizontal, horizontalValue ) ( vertical, verticalValue ) ->
            horizontalToString horizontal
                ++ " "
                ++ valueToString horizontalValue
                ++ " "
                ++ verticalToString vertical
                ++ " "
                ++ valueToString verticalValue
