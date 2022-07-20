module CSS.Types.Length exposing
    ( Length(..), toString, ViewportSize(..)
    , zero
    , cap, ch, em, ex, ic, lh, rem, rlh
    , vh, vmax, vmin, vb, vi
    , px, cm, mm, q, inch, pc, pt
    )

{-| The <length> CSS data type represents a distance value. Lengths can be used in numerous CSS
properties, such as width, height, margin, padding, border-width, font-size, and text-shadow.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/length>

@docs Length, toString, ViewportSize


# Zero

@docs zero


# Relative length units based on font

@docs cap, ch, em, ex, ic, lh, rem, rlh


# Relative length units based on viewport

@docs vh, vw, vmax, vmin, vb, vi


# Absolute length units

@docs px, cm, mm, q, inch, pc, pt

-}


{-| <length> data type.
-}
type Length
    = Zero
    | Cap Float
    | Ch Float
    | Em Float
    | Ex Float
    | Ic Float
    | Lh Float
    | Rem Float
    | Rlh Float
    | Vh ViewportSize Float
    | Vw ViewportSize Float
    | Vmax ViewportSize Float
    | Vmin ViewportSize Float
    | Vb ViewportSize Float
    | Vi ViewportSize Float
    | Px Float
    | Cm Float
    | Mm Float
    | Q Float
    | In Float
    | Pc Float
    | Pt Float


{-| -}
type ViewportSize
    = Small
    | Large
    | Dynamic
    | Default


viewportSizeToString : ViewportSize -> String
viewportSizeToString viewportSize =
    case viewportSize of
        Small ->
            "s"

        Large ->
            "l"

        Dynamic ->
            "d"

        Default ->
            ""


{-| -}
toString : Length -> String
toString length =
    case length of
        Zero ->
            "0"

        Cap value ->
            String.fromFloat value ++ "cap"

        Ch value ->
            String.fromFloat value ++ "ch"

        Em value ->
            String.fromFloat value ++ "em"

        Ex value ->
            String.fromFloat value ++ "ex"

        Ic value ->
            String.fromFloat value ++ "ic"

        Lh value ->
            String.fromFloat value ++ "lh"

        Rem value ->
            String.fromFloat value ++ "rem"

        Rlh value ->
            String.fromFloat value ++ "rlh"

        Vh viewportSize value ->
            String.fromFloat value ++ viewportSizeToString viewportSize ++ "vh"

        Vw viewportSize value ->
            String.fromFloat value ++ viewportSizeToString viewportSize ++ "vw"

        Vmax viewportSize value ->
            String.fromFloat value ++ viewportSizeToString viewportSize ++ "vmax"

        Vmin viewportSize value ->
            String.fromFloat value ++ viewportSizeToString viewportSize ++ "vmin"

        Vb viewportSize value ->
            String.fromFloat value ++ viewportSizeToString viewportSize ++ "vb"

        Vi viewportSize value ->
            String.fromFloat value ++ viewportSizeToString viewportSize ++ "vi"

        Px value ->
            String.fromFloat value ++ "px"

        Cm value ->
            String.fromFloat value ++ "cm"

        Mm value ->
            String.fromFloat value ++ "mm"

        Q value ->
            String.fromFloat value ++ "Q"

        In value ->
            String.fromFloat value ++ "in"

        Pc value ->
            String.fromFloat value ++ "pc"

        Pt value ->
            String.fromFloat value ++ "pt"



-- ZERO


{-| Specifying the length unit is optional if the number is `0`.
-}
zero : Length
zero =
    Zero



-- RELATIVE LENGTH UNITS BASED ON FONT


{-| Represents the "cap height" (nominal height of capital letters) of the element's font.
-}
cap : Float -> Length
cap =
    Cap


{-| Represents the width or more precisely the advance measure of the glyph 0 (zero, the Unicode
character U+0030) in the element's font. In cases where it is impossible or impractical to determine
the measure of the 0 glyph, it must be assumed to be 0.5em wide by 1em tall.
-}
ch : Float -> Length
ch =
    Ch


{-| Represents the calculated font-size of the element. If used on the font-size property itself, it
represents the inherited font-size of the element.
-}
em : Float -> Length
em =
    Em


{-| Represents the x-height of the element's font. In fonts with the `x` letter, this is generally
the height of lowercase letters in the font; `1ex ≈ 0.5em` in many fonts.
-}
ex : Float -> Length
ex =
    Ex


{-| Equal to the used advance measure of the "水" glyph (CJK water ideograph, U+6C34), found in the
font used to render it.
-}
ic : Float -> Length
ic =
    Ic


{-| Equal to the computed value of the line-height property of the element on which it is used,
converted to an absolute length.
-}
lh : Float -> Length
lh =
    Lh


{-| Represents the font-size of the root element (typically <html>). When used within the root
element font-size, it represents its initial value (a common browser default is `16px`, but
user-defined preferences may modify this).
-}
rem : Float -> Length
rem =
    Rem


{-| Equal to the computed value of the line-height property on the root element (typically <html>),
converted to an absolute length. When used on the font-size or line-height properties of the root
element, it refers to the properties' initial value.
-}
rlh : Float -> Length
rlh =
    Rlh



-- RELATIVE LENGTH UNITS BASED ON VIEWPORT


{-| Represents a percentage of the height of the viewport's initial containing block. `1vh` is 1% of
the viewport height. For example, if the viewport height is `300px`, then a value of `70vh` on a
property will be `210px`.

For small, large, and dynamic viewport sizes, the respective viewport-percentage units are `svh`,
`lvh`, and `dvh`. `vh` represents the viewport-percentage length unit based on the browser default
viewport size.

-}
vh : ViewportSize -> Float -> Length
vh =
    Vh


{-| Represents a percentage of the width of the viewport's initial containing block. `1vw` is 1% of
the viewport width. For example, if the viewport width is `800px`, then a value of `50vw` on a
property will be `400px`.

For small, large, and dynamic viewport sizes, the respective viewport-percentage units are `svh`,
`lvh`, and `dvh`. `vh` represents the viewport-percentage length unit based on the browser default
viewport size.

-}
vw : ViewportSize -> Float -> Length
vw =
    Vw


{-| Represents in percentage the larger of `vw` and `vh`.

For small, large, and dynamic viewport sizes, the respective viewport-percentage units are `svmax`,
`lvmax`, and `dvmax`. `vmax` represents the viewport-percentage length unit based on the browser
default viewport size.

-}
vmax : ViewportSize -> Float -> Length
vmax =
    Vmax


{-| Represents in percentage the smaller of `vw` and `vh`.

For small, large, and dynamic viewport sizes, the respective viewport-percentage units are `svmin`,
`lvmin`, and `dvmin`. `vmin` represents the viewport-percentage length unit based on the browser
default viewport size.

-}
vmin : ViewportSize -> Float -> Length
vmin =
    Vmin


{-| Represents percentage of the size of the initial containing block, in the direction of the root
element's block axis.

For small, large, and dynamic viewport sizes, the respective viewport-percentage units are `svb`,
`lvb`, and `dvb`, respectively. `vb` represents the viewport-percentage length unit based on the
browser default viewport size.

-}
vb : ViewportSize -> Float -> Length
vb =
    Vb


{-| Represents a percentage of the size of the initial containing block, in the direction of the
root element's inline axis.

For small, large, and dynamic viewport sizes, the respective viewport-percentage units are `svi`,
`lvi`, and `dvi`. `vi` represents the viewport-percentage length unit based on the browser default
viewport size.

-}
vi : ViewportSize -> Float -> Length
vi =
    Vi



-- ABSOLUTE LENGTH UNITS


{-| One pixel. For screen displays, it traditionally represents one device pixel (dot). However,
for printers and high-resolution screens, one CSS pixel implies multiple device pixels.
`1px` = 1/96th of `1in`.
-}
px : Float -> Length
px =
    Px


{-| One centimeter. `1cm` = `96px/2.54`.
-}
cm : Float -> Length
cm =
    Cm


{-| One millimeter. `1mm` = 1/10th of `1cm`.
-}
mm : Float -> Length
mm =
    Mm


{-| One quarter of a millimeter. `1Q` = 1/40th of `1cm`.
-}
q : Float -> Length
q =
    Q


{-| One inch. `1in` = `2.54cm` = `96px`.
-}
inch : Float -> Length
inch =
    In


{-| One pica. `1pc` = `12pt` = 1/6th of `1in`.
-}
pc : Float -> Length
pc =
    Pc


{-| One point. `1pt` = 1/72nd of `1in`.
-}
pt : Float -> Length
pt =
    Pt
