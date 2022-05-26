module CSS.Types.Time exposing (Time(..), toString)


type Time
    = Seconds Float
    | Milliseconds Float


toString : Time -> String
toString time =
    case time of
        Seconds value ->
            String.fromFloat value ++ "s"

        Milliseconds value ->
            String.fromFloat value ++ "ms"
