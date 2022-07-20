module CSS.Types.Color exposing
    ( Color, toString
    , aliceblue, antiquewhite, aqua, aquamarine, azure, beige, bisque, black, blanchedalmond, blue, blueviolet, brown
    , burlywood, cadetblue, chartreuse, chocolate, coral, cornflowerblue, cornsilk, crimson, cyan, darkblue, darkcyan
    , darkgoldenrod, darkgray, darkgreen, darkgrey, darkkhaki, darkmagenta, darkolivegreen, darkorange, darkorchid, darkred
    , darksalmon, darkseagreen, darkslateblue, darkslategray, darkslategrey, darkturquoise, darkviolet, deeppink, deepskyblue
    , dimgray, dimgrey, dodgerblue, firebrick, floralwhite, forestgreen, fuchsia, gainsboro, ghostwhite, gold, goldenrod
    , gray, green, greenyellow, grey, honeydew, hotpink, indianred, indigo, ivory, khaki, lavender, lavenderblush
    , lawngreen, lemonchiffon, lightblue, lightcoral, lightcyan, lightgoldenrodyellow, lightgray, lightgreen, lightgrey
    , lightpink, lightsalmon, lightseagreen, lightskyblue, lightslategray, lightslategrey, lightsteelblue, lightyellow, lime
    , limegreen, linen, magenta, maroon, mediumaquamarine, mediumblue, mediumorchid, mediumpurple, mediumseagreen, mediumslateblue
    , mediumspringgreen, mediumturquoise, mediumvioletred, midnightblue, mintcream, mistyrose, moccasin, navajowhite, navy, oldlace
    , olive, olivedrab, orange, orangered, orchid, palegoldenrod, palegreen, paleturquoise, palevioletred, papayawhip, peachpuff
    , peru, pink, plum, powderblue, purple, rebeccapurple, red, rosybrown, royalblue, saddlebrown, salmon, sandybrown, seagreen
    , seashell, sienna, silver, skyblue, slateblue, slategray, slategrey, snow, springgreen, steelblue, tan, teal, thistle, tomato
    , turquoise, violet, wheat, white, whitesmoke, yellow, yellowgreen
    , transparent
    , currentColor
    , rgb, rgba
    , hsl, hsla
    )

{-| The <color> CSS data type represents a color. A <color> may also include an
alpha-channel transparency value, indicating how the color should composite with
its background.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/color_value>

@docs Color, toString


# Color keywords

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/color_value/color_keywords>

@docs aliceblue, antiquewhite, aqua, aquamarine, azure, beige, bisque, black, blanchedalmond, blue, blueviolet, brown
@docs burlywood, cadetblue, chartreuse, chocolate, coral, cornflowerblue, cornsilk, crimson, cyan, darkblue, darkcyan
@docs darkgoldenrod, darkgray, darkgreen, darkgrey, darkkhaki, darkmagenta, darkolivegreen, darkorange, darkorchid, darkred
@docs darksalmon, darkseagreen, darkslateblue, darkslategray, darkslategrey, darkturquoise, darkviolet, deeppink, deepskyblue
@docs dimgray, dimgrey, dodgerblue, firebrick, floralwhite, forestgreen, fuchsia, gainsboro, ghostwhite, gold, goldenrod
@docs gray, green, greenyellow, grey, honeydew, hotpink, indianred, indigo, ivory, khaki, lavender, lavenderblush
@docs lawngreen, lemonchiffon, lightblue, lightcoral, lightcyan, lightgoldenrodyellow, lightgray, lightgreen, lightgrey
@docs lightpink, lightsalmon, lightseagreen, lightskyblue, lightslategray, lightslategrey, lightsteelblue, lightyellow, lime
@docs limegreen, linen, magenta, maroon, mediumaquamarine, mediumblue, mediumorchid, mediumpurple, mediumseagreen, mediumslateblue
@docs mediumspringgreen, mediumturquoise, mediumvioletred, midnightblue, mintcream, mistyrose, moccasin, navajowhite, navy, oldlace
@docs olive, olivedrab, orange, orangered, orchid, palegoldenrod, palegreen, paleturquoise, palevioletred, papayawhip, peachpuff
@docs peru, pink, plum, powderblue, purple, rebeccapurple, red, rosybrown, royalblue, saddlebrown, salmon, sandybrown, seagreen
@docs seashell, sienna, silver, skyblue, slateblue, slategray, slategrey, snow, springgreen, steelblue, tan, teal, thistle, tomato
@docs turquoise, violet, wheat, white, whitesmoke, yellow, yellowgreen


# Transparent keyword

@docs transparent


# CurrentColor keyword

@docs currentColor


# RGB colors

@docs rgb, rgba


# HSL colors

@docs hsl, hsla

-}


{-| <color> data type.
-}
type Color
    = Color String


{-| -}
toString : Color -> String
toString (Color value) =
    value



-- COLOR KEYWORDS


{-| `black` color keyword.
-}
black : Color
black =
    Color "black"


{-| `silver` color keyword.
-}
silver : Color
silver =
    Color "silver"


{-| `gray` color keyword.
-}
gray : Color
gray =
    Color "gray"


{-| `white` color keyword.
-}
white : Color
white =
    Color "white"


{-| `maroon` color keyword.
-}
maroon : Color
maroon =
    Color "maroon"


{-| `red` color keyword.
-}
red : Color
red =
    Color "red"


{-| `purple` color keyword.
-}
purple : Color
purple =
    Color "purple"


{-| `fuchsia` color keyword.
-}
fuchsia : Color
fuchsia =
    Color "fuchsia"


{-| `green` color keyword.
-}
green : Color
green =
    Color "green"


{-| `lime` color keyword.
-}
lime : Color
lime =
    Color "lime"


{-| `olive` color keyword.
-}
olive : Color
olive =
    Color "olive"


{-| `yellow` color keyword.
-}
yellow : Color
yellow =
    Color "yellow"


{-| `navy` color keyword.
-}
navy : Color
navy =
    Color "navy"


{-| `blue` color keyword.
-}
blue : Color
blue =
    Color "blue"


{-| `teal` color keyword.
-}
teal : Color
teal =
    Color "teal"


{-| `aqua` color keyword.
-}
aqua : Color
aqua =
    Color "aqua"


{-| `orange` color keyword.
-}
orange : Color
orange =
    Color "orange"


{-| `aliceblue` color keyword.
-}
aliceblue : Color
aliceblue =
    Color "aliceblue"


{-| `antiquewhite` color keyword.
-}
antiquewhite : Color
antiquewhite =
    Color "antiquewhite"


{-| `aquamarine` color keyword.
-}
aquamarine : Color
aquamarine =
    Color "aquamarine"


{-| `azure` color keyword.
-}
azure : Color
azure =
    Color "azure"


{-| `beige` color keyword.
-}
beige : Color
beige =
    Color "beige"


{-| `bisque` color keyword.
-}
bisque : Color
bisque =
    Color "bisque"


{-| `blanchedalmond` color keyword.
-}
blanchedalmond : Color
blanchedalmond =
    Color "blanchedalmond"


{-| `blueviolet` color keyword.
-}
blueviolet : Color
blueviolet =
    Color "blueviolet"


{-| `brown` color keyword.
-}
brown : Color
brown =
    Color "brown"


{-| `burlywood` color keyword.
-}
burlywood : Color
burlywood =
    Color "burlywood"


{-| `cadetblue` color keyword.
-}
cadetblue : Color
cadetblue =
    Color "cadetblue"


{-| `chartreuse` color keyword.
-}
chartreuse : Color
chartreuse =
    Color "chartreuse"


{-| `chocolate` color keyword.
-}
chocolate : Color
chocolate =
    Color "chocolate"


{-| `coral` color keyword.
-}
coral : Color
coral =
    Color "coral"


{-| `cornflowerblue` color keyword.
-}
cornflowerblue : Color
cornflowerblue =
    Color "cornflowerblue"


{-| `cornsilk` color keyword.
-}
cornsilk : Color
cornsilk =
    Color "cornsilk"


{-| `crimson` color keyword.
-}
crimson : Color
crimson =
    Color "crimson"


{-| `cyan` color keyword.
-}
cyan : Color
cyan =
    Color "cyan"


{-| `darkblue` color keyword.
-}
darkblue : Color
darkblue =
    Color "darkblue"


{-| `darkcyan` color keyword.
-}
darkcyan : Color
darkcyan =
    Color "darkcyan"


{-| `darkgoldenrod` color keyword.
-}
darkgoldenrod : Color
darkgoldenrod =
    Color "darkgoldenrod"


{-| `darkgray` color keyword.
-}
darkgray : Color
darkgray =
    Color "darkgray"


{-| `darkgreen` color keyword.
-}
darkgreen : Color
darkgreen =
    Color "darkgreen"


{-| `darkgrey` color keyword.
-}
darkgrey : Color
darkgrey =
    Color "darkgrey"


{-| `darkkhaki` color keyword.
-}
darkkhaki : Color
darkkhaki =
    Color "darkkhaki"


{-| `darkmagenta` color keyword.
-}
darkmagenta : Color
darkmagenta =
    Color "darkmagenta"


{-| `darkolivegreen` color keyword.
-}
darkolivegreen : Color
darkolivegreen =
    Color "darkolivegreen"


{-| `darkorange` color keyword.
-}
darkorange : Color
darkorange =
    Color "darkorange"


{-| `darkorchid` color keyword.
-}
darkorchid : Color
darkorchid =
    Color "darkorchid"


{-| `darkred` color keyword.
-}
darkred : Color
darkred =
    Color "darkred"


{-| `darksalmon` color keyword.
-}
darksalmon : Color
darksalmon =
    Color "darksalmon"


{-| `darkseagreen` color keyword.
-}
darkseagreen : Color
darkseagreen =
    Color "darkseagreen"


{-| `darkslateblue` color keyword.
-}
darkslateblue : Color
darkslateblue =
    Color "darkslateblue"


{-| `darkslategray` color keyword.
-}
darkslategray : Color
darkslategray =
    Color "darkslategray"


{-| `darkslategrey` color keyword.
-}
darkslategrey : Color
darkslategrey =
    Color "darkslategrey"


{-| `darkturquoise` color keyword.
-}
darkturquoise : Color
darkturquoise =
    Color "darkturquoise"


{-| `darkviolet` color keyword.
-}
darkviolet : Color
darkviolet =
    Color "darkviolet"


{-| `deeppink` color keyword.
-}
deeppink : Color
deeppink =
    Color "deeppink"


{-| `deepskyblue` color keyword.
-}
deepskyblue : Color
deepskyblue =
    Color "deepskyblue"


{-| `dimgray` color keyword.
-}
dimgray : Color
dimgray =
    Color "dimgray"


{-| `dimgrey` color keyword.
-}
dimgrey : Color
dimgrey =
    Color "dimgrey"


{-| `dodgerblue` color keyword.
-}
dodgerblue : Color
dodgerblue =
    Color "dodgerblue"


{-| `firebrick` color keyword.
-}
firebrick : Color
firebrick =
    Color "firebrick"


{-| `floralwhite` color keyword.
-}
floralwhite : Color
floralwhite =
    Color "floralwhite"


{-| `forestgreen` color keyword.
-}
forestgreen : Color
forestgreen =
    Color "forestgreen"


{-| `gainsboro` color keyword.
-}
gainsboro : Color
gainsboro =
    Color "gainsboro"


{-| `ghostwhite` color keyword.
-}
ghostwhite : Color
ghostwhite =
    Color "ghostwhite"


{-| `gold` color keyword.
-}
gold : Color
gold =
    Color "gold"


{-| `goldenrod` color keyword.
-}
goldenrod : Color
goldenrod =
    Color "goldenrod"


{-| `greenyellow` color keyword.
-}
greenyellow : Color
greenyellow =
    Color "greenyellow"


{-| `grey` color keyword.
-}
grey : Color
grey =
    Color "grey"


{-| `honeydew` color keyword.
-}
honeydew : Color
honeydew =
    Color "honeydew"


{-| `hotpink` color keyword.
-}
hotpink : Color
hotpink =
    Color "hotpink"


{-| `indianred` color keyword.
-}
indianred : Color
indianred =
    Color "indianred"


{-| `indigo` color keyword.
-}
indigo : Color
indigo =
    Color "indigo"


{-| `ivory` color keyword.
-}
ivory : Color
ivory =
    Color "ivory"


{-| `khaki` color keyword.
-}
khaki : Color
khaki =
    Color "khaki"


{-| `lavender` color keyword.
-}
lavender : Color
lavender =
    Color "lavender"


{-| `lavenderblush` color keyword.
-}
lavenderblush : Color
lavenderblush =
    Color "lavenderblush"


{-| `lawngreen` color keyword.
-}
lawngreen : Color
lawngreen =
    Color "lawngreen"


{-| `lemonchiffon` color keyword.
-}
lemonchiffon : Color
lemonchiffon =
    Color "lemonchiffon"


{-| `lightblue` color keyword.
-}
lightblue : Color
lightblue =
    Color "lightblue"


{-| `lightcoral` color keyword.
-}
lightcoral : Color
lightcoral =
    Color "lightcoral"


{-| `lightcyan` color keyword.
-}
lightcyan : Color
lightcyan =
    Color "lightcyan"


{-| `lightgoldenrodyellow` color keyword.
-}
lightgoldenrodyellow : Color
lightgoldenrodyellow =
    Color "lightgoldenrodyellow"


{-| `lightgray` color keyword.
-}
lightgray : Color
lightgray =
    Color "lightgray"


{-| `lightgreen` color keyword.
-}
lightgreen : Color
lightgreen =
    Color "lightgreen"


{-| `lightgrey` color keyword.
-}
lightgrey : Color
lightgrey =
    Color "lightgrey"


{-| `lightpink` color keyword.
-}
lightpink : Color
lightpink =
    Color "lightpink"


{-| `lightsalmon` color keyword.
-}
lightsalmon : Color
lightsalmon =
    Color "lightsalmon"


{-| `lightseagreen` color keyword.
-}
lightseagreen : Color
lightseagreen =
    Color "lightseagreen"


{-| `lightskyblue` color keyword.
-}
lightskyblue : Color
lightskyblue =
    Color "lightskyblue"


{-| `lightslategray` color keyword.
-}
lightslategray : Color
lightslategray =
    Color "lightslategray"


{-| `lightslategrey` color keyword.
-}
lightslategrey : Color
lightslategrey =
    Color "lightslategrey"


{-| `lightsteelblue` color keyword.
-}
lightsteelblue : Color
lightsteelblue =
    Color "lightsteelblue"


{-| `lightyellow` color keyword.
-}
lightyellow : Color
lightyellow =
    Color "lightyellow"


{-| `limegreen` color keyword.
-}
limegreen : Color
limegreen =
    Color "limegreen"


{-| `linen` color keyword.
-}
linen : Color
linen =
    Color "linen"


{-| `magenta` color keyword.
-}
magenta : Color
magenta =
    Color "magenta"


{-| `mediumaquamarine` color keyword.
-}
mediumaquamarine : Color
mediumaquamarine =
    Color "mediumaquamarine"


{-| `mediumblue` color keyword.
-}
mediumblue : Color
mediumblue =
    Color "mediumblue"


{-| `mediumorchid` color keyword.
-}
mediumorchid : Color
mediumorchid =
    Color "mediumorchid"


{-| `mediumpurple` color keyword.
-}
mediumpurple : Color
mediumpurple =
    Color "mediumpurple"


{-| `mediumseagreen` color keyword.
-}
mediumseagreen : Color
mediumseagreen =
    Color "mediumseagreen"


{-| `mediumslateblue` color keyword.
-}
mediumslateblue : Color
mediumslateblue =
    Color "mediumslateblue"


{-| `mediumspringgreen` color keyword.
-}
mediumspringgreen : Color
mediumspringgreen =
    Color "mediumspringgreen"


{-| `mediumturquoise` color keyword.
-}
mediumturquoise : Color
mediumturquoise =
    Color "mediumturquoise"


{-| `mediumvioletred` color keyword.
-}
mediumvioletred : Color
mediumvioletred =
    Color "mediumvioletred"


{-| `midnightblue` color keyword.
-}
midnightblue : Color
midnightblue =
    Color "midnightblue"


{-| `mintcream` color keyword.
-}
mintcream : Color
mintcream =
    Color "mintcream"


{-| `mistyrose` color keyword.
-}
mistyrose : Color
mistyrose =
    Color "mistyrose"


{-| `moccasin` color keyword.
-}
moccasin : Color
moccasin =
    Color "moccasin"


{-| `navajowhite` color keyword.
-}
navajowhite : Color
navajowhite =
    Color "navajowhite"


{-| `oldlace` color keyword.
-}
oldlace : Color
oldlace =
    Color "oldlace"


{-| `olivedrab` color keyword.
-}
olivedrab : Color
olivedrab =
    Color "olivedrab"


{-| `orangered` color keyword.
-}
orangered : Color
orangered =
    Color "orangered"


{-| `orchid` color keyword.
-}
orchid : Color
orchid =
    Color "orchid"


{-| `palegoldenrod` color keyword.
-}
palegoldenrod : Color
palegoldenrod =
    Color "palegoldenrod"


{-| `palegreen` color keyword.
-}
palegreen : Color
palegreen =
    Color "palegreen"


{-| `paleturquoise` color keyword.
-}
paleturquoise : Color
paleturquoise =
    Color "paleturquoise"


{-| `palevioletred` color keyword.
-}
palevioletred : Color
palevioletred =
    Color "palevioletred"


{-| `papayawhip` color keyword.
-}
papayawhip : Color
papayawhip =
    Color "papayawhip"


{-| `peachpuff` color keyword.
-}
peachpuff : Color
peachpuff =
    Color "peachpuff"


{-| `peru` color keyword.
-}
peru : Color
peru =
    Color "peru"


{-| `pink` color keyword.
-}
pink : Color
pink =
    Color "pink"


{-| `plum` color keyword.
-}
plum : Color
plum =
    Color "plum"


{-| `powderblue` color keyword.
-}
powderblue : Color
powderblue =
    Color "powderblue"


{-| `rosybrown` color keyword.
-}
rosybrown : Color
rosybrown =
    Color "rosybrown"


{-| `royalblue` color keyword.
-}
royalblue : Color
royalblue =
    Color "royalblue"


{-| `saddlebrown` color keyword.
-}
saddlebrown : Color
saddlebrown =
    Color "saddlebrown"


{-| `salmon` color keyword.
-}
salmon : Color
salmon =
    Color "salmon"


{-| `sandybrown` color keyword.
-}
sandybrown : Color
sandybrown =
    Color "sandybrown"


{-| `seagreen` color keyword.
-}
seagreen : Color
seagreen =
    Color "seagreen"


{-| `seashell` color keyword.
-}
seashell : Color
seashell =
    Color "seashell"


{-| `sienna` color keyword.
-}
sienna : Color
sienna =
    Color "sienna"


{-| `skyblue` color keyword.
-}
skyblue : Color
skyblue =
    Color "skyblue"


{-| `slateblue` color keyword.
-}
slateblue : Color
slateblue =
    Color "slateblue"


{-| `slategray` color keyword.
-}
slategray : Color
slategray =
    Color "slategray"


{-| `slategrey` color keyword.
-}
slategrey : Color
slategrey =
    Color "slategrey"


{-| `snow` color keyword.
-}
snow : Color
snow =
    Color "snow"


{-| `springgreen` color keyword.
-}
springgreen : Color
springgreen =
    Color "springgreen"


{-| `steelblue` color keyword.
-}
steelblue : Color
steelblue =
    Color "steelblue"


{-| `tan` color keyword.
-}
tan : Color
tan =
    Color "tan"


{-| `thistle` color keyword.
-}
thistle : Color
thistle =
    Color "thistle"


{-| `tomato` color keyword.
-}
tomato : Color
tomato =
    Color "tomato"


{-| `turquoise` color keyword.
-}
turquoise : Color
turquoise =
    Color "turquoise"


{-| `violet` color keyword.
-}
violet : Color
violet =
    Color "violet"


{-| `wheat` color keyword.
-}
wheat : Color
wheat =
    Color "wheat"


{-| `whitesmoke` color keyword.
-}
whitesmoke : Color
whitesmoke =
    Color "whitesmoke"


{-| `yellowgreen` color keyword.
-}
yellowgreen : Color
yellowgreen =
    Color "yellowgreen"


{-| `rebeccapurple` color keyword.
-}
rebeccapurple : Color
rebeccapurple =
    Color "rebeccapurple"



-- TRANSPARENT KEYWORD


{-| The transparent keyword represents a fully transparent color. This makes the
background behind the colored item completely visible. Technically, transparent
is a shortcut for rgba(0,0,0,0).
-}
transparent : Color
transparent =
    Color "transparent"



-- CURRENTCOLOR KEYWORD


{-| The currentColor keyword represents the value of an element's color property.
This lets you use the color value on properties that do not receive it by default.
-}
currentColor : Color
currentColor =
    Color "currentcolor"



-- FUNCTIONAL


{-| RGB colors can be expressed through the functional (rgb(), rgba()) notations.
-}
rgb : { red : Int, green : Int, blue : Int } -> Color
rgb values =
    Color
        ("rgb("
            ++ String.fromInt values.red
            ++ ", "
            ++ String.fromInt values.green
            ++ ", "
            ++ String.fromInt values.blue
            ++ ")"
        )


{-| RGB colors can be expressed through the functional (rgb(), rgba()) notations.
-}
rgba : { red : Int, green : Int, blue : Int, alpha : Float } -> Color
rgba values =
    Color
        ("rgba("
            ++ String.fromInt values.red
            ++ ", "
            ++ String.fromInt values.green
            ++ ", "
            ++ String.fromInt values.blue
            ++ ", "
            ++ String.fromFloat values.alpha
            ++ ")"
        )


{-| HSL colors are expressed through the functional hsl() and hsla() notations.
-}
hsl : { hue : Float, saturation : Float, lightness : Float } -> Color
hsl values =
    Color
        ("hsl("
            ++ String.fromFloat values.hue
            ++ ", "
            ++ String.fromFloat values.saturation
            ++ ", "
            ++ String.fromFloat values.lightness
            ++ ")"
        )


{-| HSL colors are expressed through the functional hsl() and hsla() notations.
-}
hsla : { hue : Float, saturation : Float, lightness : Float, alpha : Float } -> Color
hsla values =
    Color
        ("hsla("
            ++ String.fromFloat values.hue
            ++ ", "
            ++ String.fromFloat values.saturation
            ++ ", "
            ++ String.fromFloat values.lightness
            ++ ", "
            ++ String.fromFloat values.alpha
            ++ ")"
        )
