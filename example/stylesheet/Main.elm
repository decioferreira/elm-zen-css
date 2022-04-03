module Main exposing (button, number)

import CSS exposing (CSS)
import CSS.Property as Property
import CSS.PseudoClass as PseudoClass



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
    Property.custom "font-family" "'Lucida Console', 'Courier New', monospace"
        >> Property.custom "font-size" "26px"



-- Classes


button : CSS
button =
    CSS.css "button"
        |> fontStyle
        |> Property.background color
        |> Property.color "white"
        |> Property.custom "border" "none"
        |> Property.custom "padding" (CSS.var buttonPadding)
        |> PseudoClass.hover
            (Property.background "lightgreen"
                >> Property.color "black"
            )


number : CSS.CSS
number =
    CSS.css "number"
        |> fontStyle
        |> Property.color color
        |> Property.custom "padding" "var(--number-padding, 10px)"
