module CSS.Properties.Animation.PlayState exposing
    ( running, paused
    , multiple
    , inherit, initial, revert, revertLayer, unset
    , PlayState(..), playStateToString
    )

{-| The animation-play-state CSS property sets whether an animation is running or paused.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/animation-play-state>


# Single animation

@docs running, paused


# Multiple animations

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs PlayState, playStateToString

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "animation-play-state"


{-| -}
type PlayState
    = Running
    | Paused


{-| -}
playStateToString : PlayState -> String
playStateToString playState =
    case playState of
        Running ->
            "running"

        Paused ->
            "paused"



-- SINGLE ANIMATION


{-| The animation is currently playing.
-}
running : Property
running =
    multiple (List.Nonempty.singleton Running)


{-| The animation is currently paused.
-}
paused : Property
paused =
    multiple (List.Nonempty.singleton Paused)



-- MULTIPLE ANIMATIONS


{-| -}
multiple : Nonempty PlayState -> Property
multiple =
    List.Nonempty.toList
        >> List.map playStateToString
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
