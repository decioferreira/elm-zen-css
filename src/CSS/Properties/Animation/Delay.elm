module CSS.Properties.Animation.Delay exposing
    ( time
    , inherit, initial, revert, revertLayer, unset
    )

{-| The animation-delay CSS property specifies the amount of time to wait from applying the
animation to an element before beginning to perform the animation. The animation can start later,
immediately from its beginning, or immediately and partway through the animation.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/animation-delay>


# <time> values

@docs time


# Global values

@docs inherit, initial, revert, revertLayer, unset

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import CSS.Types.Time as Time exposing (Time)
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "animation-delay"



-- VALUES


{-| The time offset, from the moment at which the animation is applied to the element, at which the
animation should begin. This may be specified in either seconds (s) or milliseconds (ms). The unit
is required.
-}
time : Nonempty Time -> Property
time =
    List.Nonempty.toList
        >> List.map Time.toString
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
