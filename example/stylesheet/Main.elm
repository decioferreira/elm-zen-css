module Main exposing
    ( button
    , checkbox
    , cylonEye
    , listItem0
    , listItem1
    , number
    , pollingMessage
    , strong
    , svgCircle
    , viewPort
    )

import CSS exposing (Class, Keyframe, Property, Variable)
import CSS.AtRules as AtRules
import CSS.AtRules.Keyframes as Keyframes
import CSS.Properties as Properties
import CSS.Properties.AccentColor as AccentColor
import CSS.Properties.Animation as Animation exposing (defaultSingleAnimation)
import CSS.PseudoClasses as PseudoClasses
import CSS.PseudoElements as PseudoElements
import CSS.Types.Color as Color
import CSS.Types.Time as Time
import CSS.Variables as Variables
import List.Nonempty as Nonempty



-- VARIABLES


color : String
color =
    "green"



-- CSS VARIABLES


buttonPadding : Variable
buttonPadding =
    Variables.variable "button-padding" "10px"



-- HELPERS


fontStyle : List Property
fontStyle =
    [ Properties.custom "font-family" "'Lucida Console', 'Courier New', monospace"
    , Properties.custom "font-size" "26px"
    ]



-- CLASSES


button : Class
button =
    CSS.class "button"
        (Properties.custom "background" color
            :: Properties.custom "color" "white"
            :: Properties.custom "border" "none"
            :: Properties.custom "padding" (Variables.var buttonPadding)
            :: fontStyle
        )
        |> PseudoClasses.hover
            [ Properties.custom "background" "lightgreen"
            , Properties.custom "color" "black"
            ]
        |> AtRules.media "screen and (max-width: 900px)"
            [ Properties.custom "width" "100%"
            ]


number : Class
number =
    CSS.class "number"
        (Properties.custom "color" color
            :: Properties.custom "padding" "var(--number-padding, 10px)"
            :: fontStyle
        )
        |> PseudoElements.before [ Properties.custom "content" "'('" ]
        |> PseudoElements.after [ Properties.custom "content" "')'" ]


strong : Class
strong =
    CSS.class "strong"
        [ Properties.custom "font-weight" "bold"
        ]


checkbox : Class
checkbox =
    CSS.class "checkbox"
        [ AccentColor.color Color.red
        ]


listItem0 : Class
listItem0 =
    CSS.class "list-item-0"
        [ Properties.custom "list-style-type" "'\\\\1F534'"
        ]


listItem1 : Class
listItem1 =
    CSS.class "list-item-1"
        [ Properties.custom "list-style-type" "'\\\\1F535'"
        ]


svgCircle : Class
svgCircle =
    CSS.class "svg-circle"
        [ Properties.custom "fill" "#1293D8"
        ]


pollingMessage : Class
pollingMessage =
    CSS.class "polling-message"
        [ Properties.custom "color" "white"
        , Properties.custom "float" "left"
        , Properties.custom "margin-right" "2%"
        ]


viewPort : Class
viewPort =
    CSS.class "view-port"
        [ Properties.custom "background-color" "black"
        , Properties.custom "height" "25px"
        , Properties.custom "width" "100%"
        , Properties.custom "overflow" "hidden"
        ]


cylonEye : Class
cylonEye =
    CSS.class "cylon-eye"
        [ Properties.custom "background-color" "red"
        , Properties.custom "background-image" "linear-gradient(to right, rgba(0, 0, 0, .9) 25%, rgba(0, 0, 0, .1) 50%, rgba(0, 0, 0, .9) 75%)"
        , Properties.custom "color" "white"
        , Properties.custom "height" "100%"
        , Properties.custom "width" "20%"
        , Animation.animation
            (Nonempty.singleton
                { defaultSingleAnimation
                    | delay = Just (Time.Seconds 4)
                    , easingFunction = Just Animation.Linear
                    , duration = Just (Time.Seconds 0)
                    , iterationCount = Just Animation.Infinite
                    , direction = Just Animation.Alternate
                    , name = Just (Animation.KeyframeName moveEye)
                }
            )
        ]


moveEye : Keyframe
moveEye =
    Keyframes.fromTo (Keyframes.NameCustomIdent "move_eye")
        [ Properties.custom "margin-left" "-20%"
        ]
        [ Properties.custom "margin-left" "100%"
        ]
