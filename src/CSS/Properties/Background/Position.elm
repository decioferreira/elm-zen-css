module CSS.Properties.Background.Position exposing
    ( position
    , multiple
    , inherit, initial, revert, revertLayer, unset
    )

{-| The `background-position` CSS property sets the initial position for each background image.
The position is relative to the position layer set by background-origin.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/background-position>


# Values

@docs position


# Multiple values

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import CSS.Types.Position as Position exposing (Position)
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "background-position"



-- VALUES


position : Position -> Property
position =
    property << Position.toString



-- MULTIPLE VALUES


{-| -}
multiple : Nonempty Position -> Property
multiple =
    List.Nonempty.toList
        >> List.map Position.toString
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
