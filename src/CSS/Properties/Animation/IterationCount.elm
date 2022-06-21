module CSS.Properties.Animation.IterationCount exposing
    ( infinite, count
    , multiple
    , inherit, initial, revert, revertLayer, unset
    , IterationCount(..), iterationCountToString
    )

{-| The animation-iteration-count CSS property sets the number of times an animation sequence should
be played before stopping.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/animation-iteration-count>


# Single animation

@docs infinite, count


# Multiple animations

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs IterationCount, iterationCountToString

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "animation-iteration-count"


{-| -}
type IterationCount
    = Infinite
    | Count Float


{-| -}
iterationCountToString : IterationCount -> String
iterationCountToString iterationCount =
    case iterationCount of
        Infinite ->
            "infinite"

        Count value ->
            String.fromFloat value



-- SINGLE ANIMATION


{-| The animation will repeat forever.
-}
infinite : Property
infinite =
    multiple (List.Nonempty.singleton Infinite)


{-| The number of times the animation will repeat; this is 1 by default. You may specify non-integer
values to play part of an animation cycle: for example, 0.5 will play half of the animation cycle.
Negative values are invalid.
-}
count : Float -> Property
count value =
    multiple (List.Nonempty.singleton (Count value))



-- MULTIPLE ANIMATIONS


{-| -}
multiple : Nonempty IterationCount -> Property
multiple =
    List.Nonempty.toList
        >> List.map iterationCountToString
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
