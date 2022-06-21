module CSS.Properties.Animation exposing
    ( animation
    , SingleAnimation, defaultSingleAnimation
    )

{-| The animation shorthand CSS property applies an animation between styles. It
is a shorthand for animation-name, animation-duration, animation-timing-function,
animation-delay, animation-iteration-count, animation-direction,
animation-fill-mode, and animation-play-state.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/animation>

@docs animation


# Single Animation

@docs SingleAnimation, defaultSingleAnimation

-}

import CSS.Internal exposing (Keyframe(..), Property)
import CSS.Properties as Properties
import CSS.Properties.Animation.Direction as AnimationDirection exposing (Direction)
import CSS.Properties.Animation.FillMode as AnimationFillMode exposing (FillMode)
import CSS.Properties.Animation.IterationCount as AnimationIterationCount exposing (IterationCount)
import CSS.Properties.Animation.Name as AnimationName exposing (Name)
import CSS.Properties.Animation.PlayState as AnimationPlayState exposing (PlayState)
import CSS.Properties.Animation.TimingFunction as AnimationTimingFunction exposing (EasingFunction)
import CSS.Types.Time as Time exposing (Time)
import List.Nonempty exposing (Nonempty)


property : String -> Property
property =
    Properties.custom "animation"


{-| -}
type alias SingleAnimation =
    { delay : Maybe Time
    , easingFunction : Maybe EasingFunction
    , duration : Maybe Time
    , iterationCount : Maybe IterationCount
    , direction : Maybe Direction
    , fillMode : Maybe FillMode
    , playState : Maybe PlayState
    , name : Maybe Name
    }


{-| -}
defaultSingleAnimation : SingleAnimation
defaultSingleAnimation =
    { delay = Nothing
    , easingFunction = Nothing
    , duration = Nothing
    , iterationCount = Nothing
    , direction = Nothing
    , fillMode = Nothing
    , playState = Nothing
    , name = Nothing
    }


singleAnimationToString : SingleAnimation -> String
singleAnimationToString singleAnimation =
    [ Maybe.map Time.toString singleAnimation.delay
    , Maybe.map AnimationTimingFunction.easingFunctionToString singleAnimation.easingFunction
    , Maybe.map Time.toString singleAnimation.duration
    , Maybe.map AnimationIterationCount.iterationCountToString singleAnimation.iterationCount
    , Maybe.map AnimationDirection.directionToString singleAnimation.direction
    , Maybe.map AnimationFillMode.fillModeToString singleAnimation.fillMode
    , Maybe.map AnimationPlayState.playStateToString singleAnimation.playState
    , Maybe.map AnimationName.nameToString singleAnimation.name
    ]
        |> List.filterMap identity
        |> String.join " "


{-| -}
animation : Nonempty SingleAnimation -> Property
animation =
    List.Nonempty.toList
        >> List.map singleAnimationToString
        >> String.join ", "
        >> property
