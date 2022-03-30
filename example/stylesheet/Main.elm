module Main exposing (button, number)

import CSS exposing (CSS)



-- Variables


color : String
color =
    "green"



-- CSS Variables


buttonPadding : CSS.Variable
buttonPadding =
    CSS.variable "button-padding" "10px"



-- Helpers


fontStyle : CSS -> CSS
fontStyle =
    CSS.custom "font-family" "'Lucida Console', 'Courier New', monospace"
        >> CSS.custom "font-size" "26px"



-- Classes


button : CSS
button =
    CSS.css "button"
        |> fontStyle
        |> CSS.background color
        |> CSS.color "white"
        |> CSS.custom "border" "none"
        |> CSS.custom "padding" (CSS.var buttonPadding)


number : CSS.CSS
number =
    CSS.css "number"
        |> fontStyle
        |> CSS.color color
        |> CSS.custom "padding" "var(--number-padding, 10px)"
