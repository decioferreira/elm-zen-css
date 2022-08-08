module CSS.Properties.Animation.TimingFunction exposing
    ( linear, ease, easeIn, easeOut, easeInOut, cubicBezier, stepStart, stepEnd, steps
    , multiple
    , inherit, initial, revert, revertLayer, unset
    , EasingFunction(..), easingFunctionToString, StepPosition(..)
    )

{-| The animation-timing-function CSS property sets how an animation progresses through the duration
of each cycle.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/animation-timing-function>


# Single animation

@docs linear, ease, easeIn, easeOut, easeInOut, cubicBezier, stepStart, stepEnd, steps


# Multiple animations

@docs multiple


# Global values

@docs inherit, initial, revert, revertLayer, unset


# Types

@docs EasingFunction, easingFunctionToString, StepPosition

-}

import CSS.Internal exposing (Property)
import CSS.Properties as Properties
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "animation-timing-function"


{-| -}
type EasingFunction
    = Linear
    | Ease
    | EaseIn
    | EaseOut
    | EaseInOut
    | CubicBezier Float Float Float Float
    | StepStart
    | StepEnd
    | Steps Int (Maybe StepPosition)


{-| -}
easingFunctionToString : EasingFunction -> String
easingFunctionToString easingFunction =
    case easingFunction of
        Linear ->
            "linear"

        Ease ->
            "ease"

        EaseIn ->
            "ease-in"

        EaseOut ->
            "ease-out"

        EaseInOut ->
            "ease-in-out"

        CubicBezier p1 p2 p3 p4 ->
            "cubic-bezier("
                ++ String.fromFloat p1
                ++ ", "
                ++ String.fromFloat p2
                ++ ", "
                ++ String.fromFloat p3
                ++ ", "
                ++ String.fromFloat p4
                ++ ")"

        StepStart ->
            "step-start"

        StepEnd ->
            "step-end"

        Steps numberOfSteps Nothing ->
            "steps(" ++ String.fromInt numberOfSteps ++ ")"

        Steps numberOfSteps (Just stepPosition) ->
            "steps(" ++ String.fromInt numberOfSteps ++ ", " ++ stepPositionToString stepPosition ++ ")"


{-| -}
type StepPosition
    = JumpStart
    | JumpEnd
    | JumpNone
    | JumpBoth
    | Start
    | End


{-| -}
stepPositionToString : StepPosition -> String
stepPositionToString stepPosition =
    case stepPosition of
        JumpStart ->
            "jump-start"

        JumpEnd ->
            "jump-end"

        JumpNone ->
            "jump-none"

        JumpBoth ->
            "jump-both"

        Start ->
            "start"

        End ->
            "end"



-- SINGLE ANIMATION


{-| Equal to cubic-bezier(0.0, 0.0, 1.0, 1.0), animates at an even speed.
-}
linear : Property
linear =
    multiple (List.Nonempty.singleton Linear)


{-| Equal to cubic-bezier(0.25, 0.1, 0.25, 1.0), the default value, increases in velocity towards
the middle of the animation, slowing back down at the end.
-}
ease : Property
ease =
    multiple (List.Nonempty.singleton Ease)


{-| Equal to cubic-bezier(0.42, 0, 1.0, 1.0), starts off slowly, with the speed of the transition of
the animating property increasing until complete.
-}
easeIn : Property
easeIn =
    multiple (List.Nonempty.singleton EaseIn)


{-| Equal to cubic-bezier(0, 0, 0.58, 1.0), starts quickly, slowing down the animation continues.
-}
easeOut : Property
easeOut =
    multiple (List.Nonempty.singleton EaseOut)


{-| Equal to cubic-bezier(0, 0, 0.58, 1.0), starts quickly, slowing down the animation continues.
-}
easeInOut : Property
easeInOut =
    multiple (List.Nonempty.singleton EaseInOut)


{-| Equal to cubic-bezier(0, 0, 0.58, 1.0), starts quickly, slowing down the animation continues.
-}
cubicBezier : Float -> Float -> Float -> Float -> Property
cubicBezier p1 p2 p3 p4 =
    multiple (List.Nonempty.singleton (CubicBezier p1 p2 p3 p4))


{-| Equal to steps(1, jump-start).
-}
stepStart : Property
stepStart =
    multiple (List.Nonempty.singleton StepStart)


{-| Equal to steps(1, jump-end).
-}
stepEnd : Property
stepEnd =
    multiple (List.Nonempty.singleton StepEnd)


{-| Equal to steps(1, jump-end).
-}
steps : Int -> Maybe StepPosition -> Property
steps n stepPosition =
    multiple (List.Nonempty.singleton (Steps n stepPosition))



-- MULTIPLE ANIMATIONS


{-| -}
multiple : Nonempty EasingFunction -> Property
multiple =
    List.Nonempty.toList
        >> List.map easingFunctionToString
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
