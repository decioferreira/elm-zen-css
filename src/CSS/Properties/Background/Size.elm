module CSS.Properties.Background.Size exposing
    ( cover, contain, auto, length, percentage
    , twoValue
    , multiple
    , inherit, initial, revert, revertLayer, unset
    , Size(..), toString, Value(..)
    )

{-| The `background-size` CSS property sets the size of the element's background image. The image
can be left to its natural size, stretched, or constrained to fit the available space.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/background-size>


# Keyword values

@docs cover, contain, auto, length, percentage


# Two-value syntax

@docs twoValue


# Multiple backgrounds

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs Size, toString, Value

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import CSS.Types.Length
import CSS.Types.Percentage
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "background-size"


{-| -}
type Size
    = Cover
    | Contain
    | OneValue Value
    | TwoValue Value Value


toString : Size -> String
toString size =
    case size of
        Cover ->
            "cover"

        Contain ->
            "contain"

        OneValue value ->
            valueToString value

        TwoValue firstValue secondValue ->
            valueToString firstValue ++ " " ++ valueToString secondValue


{-| -}
type Value
    = Auto
    | Length CSS.Types.Length.Length
    | Percentage CSS.Types.Percentage.Percentage


valueToString : Value -> String
valueToString value =
    case value of
        Auto ->
            "auto"

        Length l ->
            CSS.Types.Length.toString l

        Percentage p ->
            CSS.Types.Percentage.toString p



-- KEYWORD VALUES


{-| Scales the image (while preserving its ratio) to the smallest possible size to fill the
container (that is: both its height and width completely cover the container), leaving no empty
space. If the proportions of the background differ from the element, the image is cropped either
vertically or horizontally.
-}
cover : Property
cover =
    property (toString Cover)


{-| Scales the image as large as possible within its container without cropping or stretching the
image. If the container is larger than the image, this will result in image tiling, unless the
background-repeat property is set to no-repeat.
-}
contain : Property
contain =
    property (toString Contain)


{-| Scales the background image in the corresponding direction such that its intrinsic proportions
are maintained.
-}
auto : Property
auto =
    property (toString (OneValue Auto))


{-| Stretches the image in the corresponding dimension to the specified length. Negative values are
not allowed.
-}
length : CSS.Types.Length.Length -> Property
length =
    property << toString << OneValue << Length


{-| Stretches the image in the corresponding dimension to the specified percentage of the background
positioning area. The background positioning area is determined by the value of background-origin
(by default, the padding box). However, if the background's background-attachment value is fixed,
the positioning area is instead the entire viewport. Negative values are not allowed.
-}
percentage : CSS.Types.Percentage.Percentage -> Property
percentage =
    property << toString << OneValue << Percentage



-- TWO-VALUE SYNTAX


{-| first value: width of the image, second value: height
-}
twoValue : Value -> Value -> Property
twoValue firstValue secondValue =
    property (toString (TwoValue firstValue secondValue))



-- MULTIPLE VALUES


{-| Multiple backgrounds
-}
multiple : Nonempty Size -> Property
multiple =
    List.Nonempty.toList
        >> List.map toString
        >> String.join ", "
        >> property



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
