module CSS.Types.Time exposing (Time(..), toString)

{-| The <time> CSS data type represents a time value expressed in seconds or milliseconds.
It is used in animation, transition, and related properties.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/time>

@docs Time, toString

-}


{-| <time> data type.
-}
type Time
    = Seconds Float
    | Milliseconds Float


{-| -}
toString : Time -> String
toString time =
    case time of
        Seconds value ->
            String.fromFloat value ++ "s"

        Milliseconds value ->
            String.fromFloat value ++ "ms"
