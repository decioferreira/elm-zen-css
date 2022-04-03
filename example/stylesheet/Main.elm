module Main exposing (button, number, strong, listItem)

import CSS exposing (CSS)
import CSS.Properties as Properties
import CSS.PseudoClasses as PseudoClasses
import CSS.PseudoElements as PseudoElements
import CSS.Variables as Variables



-- Variables


color : String
color =
    "green"



-- CSS Variables


buttonPadding : Variables.Variable
buttonPadding =
    Variables.variable "button-padding" "10px"



-- Helpers


fontStyle : CSS -> CSS
fontStyle =
    Properties.custom "font-family" "'Lucida Console', 'Courier New', monospace"
        >> Properties.custom "font-size" "26px"



-- Classes


button : CSS
button =
    CSS.css "button"
        |> fontStyle
        |> Properties.background color
        |> Properties.color "white"
        |> Properties.custom "border" "none"
        |> Properties.custom "padding" (Variables.var buttonPadding)
        |> PseudoClasses.hover
            (Properties.background "lightgreen"
                >> Properties.color "black"
            )


number : CSS.CSS
number =
    CSS.css "number"
        |> fontStyle
        |> Properties.color color
        |> Properties.custom "padding" "var(--number-padding, 10px)"
        |> PseudoElements.before (Properties.custom "content" "'('")
        |> PseudoElements.after (Properties.custom "content" "')'")


strong : CSS
strong =
    CSS.css "strong"
        |> Properties.custom "font-weight" "bold"

listItem : CSS
listItem =
    CSS.css "list-item"
        |> Properties.custom "list-style-type" "'\\\\1F534'"
        |> CSS.descendantClass "list-item" (Properties.custom "list-style-type" "'\\\\1F535'")