module CSS.Types.Angle exposing (Angle, toString, deg, grad, rad, turn)

{-| The <angle> CSS data type represents an angle value expressed in degrees, gradians, radians, or
turns. It is used, for example, in <gradient>s and in some transform functions.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/angle>

@docs Angle, toString, deg, grad, rad, turn

-}


{-| <angle> data type.
-}
type Angle
    = Deg Float
    | Grad Float
    | Rad Float
    | Turn Float


{-| -}
toString : Angle -> String
toString angle =
    case angle of
        Deg value ->
            String.fromFloat value ++ "deg"

        Grad value ->
            String.fromFloat value ++ "grad"

        Rad value ->
            String.fromFloat value ++ "rad"

        Turn value ->
            String.fromFloat value ++ "turn"


{-| Represents an angle in degrees. One full circle is 360deg. Examples: 0deg, 90deg, 14.23deg.
-}
deg : Float -> Angle
deg =
    Deg


{-| Represents an angle in gradians. One full circle is 400grad. Examples: 0grad, 100grad, 38.8grad.
-}
grad : Float -> Angle
grad =
    Grad


{-| Represents an angle in radians. One full circle is 2π radians which approximates to 6.2832rad.
1rad is 180/π degrees. Examples: 0rad, 1.0708rad, 6.2832rad.
-}
rad : Float -> Angle
rad =
    Rad


{-| Represents an angle in a number of turns. One full circle is 1turn. Examples: 0turn, 0.25turn,
1.2turn.
-}
turn : Float -> Angle
turn =
    Turn
