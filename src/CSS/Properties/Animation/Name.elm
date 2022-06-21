module CSS.Properties.Animation.Name exposing
    ( none, keyframe
    , multiple
    , inherit, initial, revert, revertLayer, unset
    , Name(..), nameToString
    )

{-| The animation-name CSS property specifies the names of one or more @keyframes at-rules
describing the animation or animations to apply to the element.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/animation-name>


# Single animation

@docs none, keyframe


# Multiple animations

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs Name, nameToString

-}

import CSS.Internal as Internal exposing (Property)
import CSS.Properties as Properties
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "animation-name"


{-| -}
type Name
    = None
    | Keyframe Internal.Keyframe


{-| -}
nameToString : Name -> String
nameToString name =
    case name of
        None ->
            "none"

        Keyframe (Internal.Keyframe { identifier }) ->
            identifier



-- SINGLE ANIMATION


{-| The animation will repeat forever.
-}
none : Property
none =
    multiple (List.Nonempty.singleton None)


{-| The number of times the animation will repeat; this is 1 by default. You may specify non-integer
values to play part of an animation cycle: for example, 0.5 will play half of the animation cycle.
Negative values are invalid.
-}
keyframe : Internal.Keyframe -> Property
keyframe value =
    multiple (List.Nonempty.singleton (Keyframe value))



-- MULTIPLE ANIMATIONS


{-| -}
multiple : Nonempty Name -> Property
multiple =
    List.Nonempty.toList
        >> List.map nameToString
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
