module CSS.Properties.Animation exposing
    ( animation
    , SingleAnimation, defaultSingleAnimation
    , EasingFunction(..), IterationCount(..), Direction(..), FillMode(..), PlayState, Name(..), StepPosition(..)
    )

{-| The animation shorthand CSS property applies an animation between styles. It
is a shorthand for animation-name, animation-duration, animation-timing-function,
animation-delay, animation-iteration-count, animation-direction,
animation-fill-mode, and animation-play-state.

Ref.: <https://developer.mozilla.org/en-US/docs/Web/CSS/animation>

@docs animation


# Single Animation

@docs SingleAnimation, defaultSingleAnimation


# Types

@docs EasingFunction, IterationCount, Direction, FillMode, PlayState, Name, StepPosition

-}

import CSS.Internal exposing (Keyframe(..), Property)
import CSS.Properties as Properties
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
    , Maybe.map easingFunctionToString singleAnimation.easingFunction
    , Maybe.map Time.toString singleAnimation.duration
    , Maybe.map iterationCountToString singleAnimation.iterationCount
    , Maybe.map directionToString singleAnimation.direction
    , Maybe.map fillModeToString singleAnimation.fillMode
    , Maybe.map playStateToString singleAnimation.playState
    , Maybe.map nameToString singleAnimation.name
    ]
        |> List.filterMap identity
        |> String.join " "


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

        CubicBezier _ _ _ _ ->
            "cubic-bezier()"

        StepStart ->
            "step-start"

        StepEnd ->
            "step-end"

        Steps numberOfSteps Nothing ->
            "steps(" ++ String.fromInt numberOfSteps ++ ")"

        Steps numberOfSteps (Just stepPosition) ->
            "steps(" ++ String.fromInt numberOfSteps ++ ", " ++ stepPositionToString stepPosition ++ ")"


{-| -}
type IterationCount
    = Infinite
    | Count Float


iterationCountToString : IterationCount -> String
iterationCountToString iterationCount =
    case iterationCount of
        Infinite ->
            "infinite"

        Count value ->
            String.fromFloat value


{-| -}
type Direction
    = Normal
    | Reverse
    | Alternate
    | AlternateReverse


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


{-| -}
type FillMode
    = FillModeNone
    | Forwards
    | Backwards
    | Both


fillModeToString : FillMode -> String
fillModeToString fillMode =
    case fillMode of
        FillModeNone ->
            "none"

        Forwards ->
            "forwards"

        Backwards ->
            "backwards"

        Both ->
            "both"


{-| -}
type PlayState
    = Running
    | Paused


playStateToString : PlayState -> String
playStateToString playState =
    case playState of
        Running ->
            "running"

        Paused ->
            "paused"


{-| -}
type Name
    = None
    | KeyframeName Keyframe


nameToString : Name -> String
nameToString name =
    case name of
        None ->
            "none"

        KeyframeName (Keyframe { identifier }) ->
            identifier


{-| -}
type StepPosition
    = JumpStart
    | JumpEnd
    | JumpNone
    | JumpBoth
    | Start
    | End


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


{-| -}
animation : Nonempty SingleAnimation -> Property
animation =
    List.Nonempty.toList
        >> List.map singleAnimationToString
        >> String.join ", "
        >> property
