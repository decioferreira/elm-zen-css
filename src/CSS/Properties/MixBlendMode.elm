module CSS.Properties.MixBlendMode exposing
    ( normal, multiply, screen, overlay, darken, lighten, colorDodge, colorBurn, hardLight, softLight, difference, exclusion, hue, saturation, color, luminosity, plusLighter
    , inherit, initial, revert, revertLayer, unset
    )

{-| The `mix-blend-mode` CSS property sets how an element's content should blend with the content of
the element's parent and the element's background.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/mix-blend-mode>


# Keyword values

@docs normal, multiply, screen, overlay, darken, lighten, colorDodge, colorBurn, hardLight, softLight, difference, exclusion, hue, saturation, color, luminosity, plusLighter


# Global values

@docs inherit, initial, revert, revertLayer, unset

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import CSS.Types.BlendMode as BlendMode


property : String -> Property
property =
    Properties.custom "mix-blend-mode"


{-| The final color is the top color, regardless of what the bottom color is. The effect is like two
opaque pieces of paper overlapping.
-}
normal : Property
normal =
    property (BlendMode.toString BlendMode.Normal)


{-| The final color is the result of multiplying the top and bottom colors. A black layer leads to a
black final layer, and a white layer leads to no change. The effect is like two images printed on
transparent film overlapping.
-}
multiply : Property
multiply =
    property (BlendMode.toString BlendMode.Multiply)


{-| The final color is the result of inverting the colors, multiplying them, and inverting that
value. A black layer leads to no change, and a white layer leads to a white final layer. The effect
is like two images shone onto a projection screen.
-}
screen : Property
screen =
    property (BlendMode.toString BlendMode.Screen)


{-| The final color is the result of multiply if the bottom color is darker, or screen if the bottom
color is lighter. This blend mode is equivalent to hard-light but with the layers swapped.
-}
overlay : Property
overlay =
    property (BlendMode.toString BlendMode.Overlay)


{-| The final color is composed of the darkest values of each color channel.
-}
darken : Property
darken =
    property (BlendMode.toString BlendMode.Darken)


{-| The final color is composed of the lightest values of each color channel.
-}
lighten : Property
lighten =
    property (BlendMode.toString BlendMode.Lighten)


{-| The final color is the result of dividing the bottom color by the inverse of the top color.
A black foreground leads to no change. A foreground with the inverse color of the backdrop leads to
a fully lit color. This blend mode is similar to screen, but the foreground need only be as light as
the inverse of the backdrop to create a fully lit color.
-}
colorDodge : Property
colorDodge =
    property (BlendMode.toString BlendMode.ColorDodge)


{-| The final color is the result of inverting the bottom color, dividing the value by the top color,
and inverting that value. A white foreground leads to no change. A foreground with the inverse color
of the backdrop leads to a black final image. This blend mode is similar to multiply, but the
foreground need only be as dark as the inverse of the backdrop to make the final image black.
-}
colorBurn : Property
colorBurn =
    property (BlendMode.toString BlendMode.ColorBurn)


{-| The final color is the result of multiply if the top color is darker, or screen if the top color
is lighter. This blend mode is equivalent to overlay but with the layers swapped. The effect is
similar to shining a harsh spotlight on the backdrop.
-}
hardLight : Property
hardLight =
    property (BlendMode.toString BlendMode.HardLight)


{-| The final color is similar to hard-light, but softer. This blend mode behaves similar to
hard-light. The effect is similar to shining a diffused spotlight on the backdrop.
-}
softLight : Property
softLight =
    property (BlendMode.toString BlendMode.SoftLight)


{-| The final color is the result of subtracting the darker of the two colors from the lighter one.
A black layer has no effect, while a white layer inverts the other layer's color.
-}
difference : Property
difference =
    property (BlendMode.toString BlendMode.Difference)


{-| The final color is similar to difference, but with less contrast. As with difference, a black
layer has no effect, while a white layer inverts the other layer's color.
-}
exclusion : Property
exclusion =
    property (BlendMode.toString BlendMode.Exclusion)


{-| The final color has the hue of the top color, while using the saturation and luminosity of the
bottom color.
-}
hue : Property
hue =
    property (BlendMode.toString BlendMode.Hue)


{-| The final color has the saturation of the top color, while using the hue and luminosity of the
bottom color. A pure gray backdrop, having no saturation, will have no effect.
-}
saturation : Property
saturation =
    property (BlendMode.toString BlendMode.Saturation)


{-| The final color has the hue and saturation of the top color, while using the luminosity of the
bottom color. The effect preserves gray levels and can be used to colorize the foreground.
-}
color : Property
color =
    property (BlendMode.toString BlendMode.Color)


{-| The final color has the luminosity of the top color, while using the hue and saturation of the
bottom color. This blend mode is equivalent to color, but with the layers swapped.
-}
luminosity : Property
luminosity =
    property (BlendMode.toString BlendMode.Luminosity)


{-| -}
plusLighter : Property
plusLighter =
    property "plus-lighter"



-- GLOBAL


{-| The inherit CSS keyword causes the element to take the computed value of the
property from its parent element.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/inherit>

-}
inherit : Property
inherit =
    property "inherit"


{-| The initial CSS keyword applies the initial (or default) value of a property
to an element.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/initial>

-}
initial : Property
initial =
    property "initial"


{-| The revert CSS keyword reverts the cascaded value of the property from its
current value to the value the property would have had if no changes had been
made by the current style origin to the current element.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/revert>

-}
revert : Property
revert =
    property "revert"


{-| The revert-layer CSS keyword rolls back the value of a property in a cascade
layer to the value of the property in a CSS rule matching the element in a
previous cascade layer.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/revert-layer>

-}
revertLayer : Property
revertLayer =
    property "revert-layer"


{-| The unset CSS keyword resets a property to its inherited value if the
property naturally inherits from its parent, and to its initial value if not.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/unset>

-}
unset : Property
unset =
    property "unset"
