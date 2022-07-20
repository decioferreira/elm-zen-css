module CSS.Types.BlendMode exposing (BlendMode(..), toString)

{-| The <blend-mode> CSS data type describes how colors should appear when elements overlap.
It is used in the background-blend-mode and mix-blend-mode properties.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/blend-mode>

@docs BlendMode, toString

-}


{-| <blend-mode> data type.
-}
type BlendMode
    = Normal
    | Multiply
    | Screen
    | Overlay
    | Darken
    | Lighten
    | ColorDodge
    | ColorBurn
    | HardLight
    | SoftLight
    | Difference
    | Exclusion
    | Hue
    | Saturation
    | Color
    | Luminosity


{-| -}
toString : BlendMode -> String
toString time =
    case time of
        Normal ->
            "normal"

        Multiply ->
            "multiply"

        Screen ->
            "screen"

        Overlay ->
            "overlay"

        Darken ->
            "darken"

        Lighten ->
            "lighten"

        ColorDodge ->
            "color-dodge"

        ColorBurn ->
            "color-burn"

        HardLight ->
            "hard-light"

        SoftLight ->
            "soft-light"

        Difference ->
            "difference"

        Exclusion ->
            "exclusion"

        Hue ->
            "hue"

        Saturation ->
            "saturation"

        Color ->
            "color"

        Luminosity ->
            "luminosity"
