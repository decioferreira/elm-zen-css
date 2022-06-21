module CSS.Properties.Animation.FillMode exposing
    ( none, forwards, backwards, both
    , multiple
    , inherit, initial, revert, revertLayer, unset
    , FillMode(..), fillModeToString
    )

{-| The animation-fill-mode CSS property sets how a CSS animation applies styles to its target
before and after its execution.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/animation-fill-mode>


# Single animation

@docs none, forwards, backwards, both


# Multiple animations

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs FillMode, fillModeToString

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "animation-fill-mode"


{-| -}
type FillMode
    = None
    | Forwards
    | Backwards
    | Both


{-| -}
fillModeToString : FillMode -> String
fillModeToString fillMode =
    case fillMode of
        None ->
            "none"

        Forwards ->
            "forwards"

        Backwards ->
            "backwards"

        Both ->
            "both"



-- SINGLE ANIMATION


{-| The animation will not apply any styles to the target when it's not executing. The element will
instead be displayed using any other CSS rules applied to it. This is the default value.
-}
none : Property
none =
    multiple (List.Nonempty.singleton None)


{-| The target will retain the computed values set by the last keyframe encountered during
execution.
-}
forwards : Property
forwards =
    multiple (List.Nonempty.singleton Forwards)


{-| The animation will apply the values defined in the first relevant keyframe as soon as it is
applied to the target, and retain this during the animation-delay period.
-}
backwards : Property
backwards =
    multiple (List.Nonempty.singleton Backwards)


{-| The animation will follow the rules for both forwards and backwards, thus extending the
animation properties in both directions.
-}
both : Property
both =
    multiple (List.Nonempty.singleton Both)



-- MULTIPLE ANIMATIONS


{-| -}
multiple : Nonempty FillMode -> Property
multiple =
    List.Nonempty.toList
        >> List.map fillModeToString
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
