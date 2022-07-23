module CSS.Properties.Background.Position.X exposing
    ( left, center, right, value
    , leftRelative, rightRelative
    , multiple
    , inherit, initial, revert, revertLayer, unset
    , X(..), Value(..)
    )

{-| The `background-position-x` CSS property sets the initial horizontal position for each
background image. The position is relative to the position layer set by background-origin.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/background-position-x>


# Values

@docs left, center, right, value


# Side-relative values

@docs leftRelative, rightRelative


# Multiple values

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs X, Value

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import CSS.Types.Length
import CSS.Types.Percentage
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "background-position-x"


{-| -}
type X
    = Left
    | Center
    | Right
    | Value Value
    | LeftRelative Value
    | RightRelative Value


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
xToString : X -> String
xToString x =
    case x of
        Left ->
            "left"

        Center ->
            "center"

        Right ->
            "right"

        Value v ->
            valueToString v

        LeftRelative v ->
            "left " ++ valueToString v

        RightRelative v ->
            "right " ++ valueToString v



-- VALUES


left : Property
left =
    property (xToString Left)


center : Property
center =
    property (xToString Center)


right : Property
right =
    property (xToString Right)


value : Value -> Property
value =
    property << xToString << Value



-- SIDE-RELATIVE VALUES


leftRelative : Value -> Property
leftRelative =
    property << xToString << LeftRelative


rightRelative : Value -> Property
rightRelative =
    property << xToString << RightRelative



-- MULTIPLE VALUES


{-| -}
multiple : Nonempty X -> Property
multiple =
    List.Nonempty.toList
        >> List.map xToString
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
