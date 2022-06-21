module CSS.Properties.Animation.Direction exposing
    ( normal, reverse, alternate, alternateReverse
    , multiple
    , inherit, initial, revert, revertLayer, unset
    , Direction(..), directionToString
    )

{-| The animation-delay CSS property specifies the amount of time to wait from applying the
animation to an element before beginning to perform the animation. The animation can start later,
immediately from its beginning, or immediately and partway through the animation.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/animation-delay>


# Single animation

@docs normal, reverse, alternate, alternateReverse


# Multiple animations

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs Direction, directionToString

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "animation-direction"


{-| -}
type Direction
    = Normal
    | Reverse
    | Alternate
    | AlternateReverse


{-| -}
directionToString : Direction -> String
directionToString direction =
    case direction of
        Normal ->
            "normal"

        Reverse ->
            "reverse"

        Alternate ->
            "alternate"

        AlternateReverse ->
            "alternate-reverse"



-- SINGLE ANIMATION


{-| The animation plays forwards each cycle. In other words, each time the animation cycles, the
animation will reset to the beginning state and start over again. This is the default value.
-}
normal : Property
normal =
    multiple (List.Nonempty.singleton Normal)


{-| The animation plays backwards each cycle. In other words, each time the animation cycles, the
animation will reset to the end state and start over again. Animation steps are performed backwards,
and timing functions are also reversed. For example, an ease-in timing function becomes ease-out.
-}
reverse : Property
reverse =
    multiple (List.Nonempty.singleton Reverse)


{-| The animation plays backwards each cycle. In other words, each time the animation cycles, the
animation will reset to the end state and start over again. Animation steps are performed backwards,
and timing functions are also reversed. For example, an ease-in timing function becomes ease-out.
-}
alternate : Property
alternate =
    multiple (List.Nonempty.singleton Alternate)


{-| The animation plays backwards each cycle. In other words, each time the animation cycles, the
animation will reset to the end state and start over again. Animation steps are performed backwards,
and timing functions are also reversed. For example, an ease-in timing function becomes ease-out.
-}
alternateReverse : Property
alternateReverse =
    multiple (List.Nonempty.singleton AlternateReverse)



-- MULTIPLE ANIMATIONS


{-| -}
multiple : Nonempty Direction -> Property
multiple =
    List.Nonempty.toList
        >> List.map directionToString
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
