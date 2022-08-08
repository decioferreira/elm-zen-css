module CSS.Properties.Background.Repeat exposing
    ( repeatX, repeatY, singleValue, twoValue
    , multiple
    , inherit, initial, revert, revertLayer, unset
    , RepeatStyle(..), toString, Value(..)
    )

{-| The `background-repeat` CSS property sets how background images are repeated. A background image
can be repeated along the horizontal and vertical axes, or not repeated at all.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat>


# Keyword values

@docs repeatX, repeatY, singleValue, twoValue


# Multiple values

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs RepeatStyle, toString, Value

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "background-repeat"


{-| -}
type RepeatStyle
    = RepeatX
    | RepeatY
    | SingleValue Value
    | TwoValue Value Value


{-| -}
type Value
    = Repeat
    | Space
    | Round
    | NoRepeat


{-| -}
toString : RepeatStyle -> String
toString repeatStyle =
    case repeatStyle of
        RepeatX ->
            "repeat-x"

        RepeatY ->
            "repeat-y"

        SingleValue value ->
            valueToString value

        TwoValue firstValue secondValue ->
            valueToString firstValue ++ " " ++ valueToString secondValue


valueToString : Value -> String
valueToString value =
    case value of
        Repeat ->
            "repeat"

        Space ->
            "space"

        Round ->
            "round"

        NoRepeat ->
            "no-repeat"



-- KEYWORD VALUES


{-| -}
repeatX : Property
repeatX =
    multiple (List.Nonempty.singleton RepeatX)


{-| -}
repeatY : Property
repeatY =
    multiple (List.Nonempty.singleton RepeatY)


{-| -}
singleValue : Value -> Property
singleValue value =
    multiple (List.Nonempty.singleton (SingleValue value))


{-| -}
twoValue : Value -> Value -> Property
twoValue firstValue secondValue =
    multiple (List.Nonempty.singleton (TwoValue firstValue secondValue))



-- MULTIPLE VALUES


{-| -}
multiple : Nonempty RepeatStyle -> Property
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
