module CSS.Properties.Background.Position.Y exposing
    ( top, center, bottom, value
    , bottomRelative
    , multiple
    , inherit, initial, revert, revertLayer, unset
    , Y(..), Value(..)
    )

{-| The `background-position-y` CSS property sets the initial vertical position for each background
image. The position is relative to the position layer set by background-origin.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/background-position-y>


# Values

@docs top, center, bottom, value


# Side-relative values

@docs bottomRelative


# Multiple values

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs Y, Value

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import CSS.Types.Length
import CSS.Types.Percentage
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "background-position-y"


{-| -}
type Y
    = Top
    | Center
    | Bottom
    | Value Value
    | BottomRelative Value


{-| -}
type Value
    = Percentage CSS.Types.Percentage.Percentage
    | Length CSS.Types.Length.Length


valueToString : Value -> String
valueToString v =
    case v of
        Percentage percentage ->
            CSS.Types.Percentage.toString percentage

        Length length ->
            CSS.Types.Length.toString length


{-| -}
yToString : Y -> String
yToString y =
    case y of
        Top ->
            "top"

        Center ->
            "center"

        Bottom ->
            "bottom"

        Value v ->
            valueToString v

        BottomRelative v ->
            "bottom " ++ valueToString v



-- VALUES


top : Property
top =
    property (yToString Top)


center : Property
center =
    property (yToString Center)


bottom : Property
bottom =
    property (yToString Bottom)


value : Value -> Property
value =
    property << yToString << Value



-- SIDE-RELATIVE VALUES


bottomRelative : Value -> Property
bottomRelative =
    property << yToString << BottomRelative



-- MULTIPLE VALUES


{-| -}
multiple : Nonempty Y -> Property
multiple =
    List.Nonempty.toList
        >> List.map yToString
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
