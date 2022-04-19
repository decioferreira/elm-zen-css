module Main exposing (button, checkbox, listItem, number, strong, svgCircle)

import CSS exposing (CSS)
import CSS.AtRules as AtRules
import CSS.Properties as Properties
import CSS.Properties.AccentColor as AccentColor
import CSS.PseudoClasses as PseudoClasses
import CSS.PseudoElements as PseudoElements
import CSS.Types.Color as Color
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
        |> Properties.custom "background" color
        |> Properties.custom "color" "white"
        |> Properties.custom "border" "none"
        |> Properties.custom "padding" (Variables.var buttonPadding)
        |> PseudoClasses.hover
            (Properties.custom "background" "lightgreen"
                >> Properties.custom "color" "black"
            )
        |> AtRules.media "screen and (max-width: 900px)" (Properties.custom "width" "100%")


number : CSS.CSS
number =
    CSS.css "number"
        |> fontStyle
        |> Properties.custom "color" color
        |> Properties.custom "padding" "var(--number-padding, 10px)"
        |> PseudoElements.before (Properties.custom "content" "'('")
        |> PseudoElements.after (Properties.custom "content" "')'")


strong : CSS
strong =
    CSS.css "strong"
        |> Properties.custom "font-weight" "bold"


checkbox : CSS
checkbox =
    CSS.css "checkbox"
        |> AccentColor.color Color.red


listItem : CSS
listItem =
    CSS.css "list-item"
        |> Properties.custom "list-style-type" "'\\\\1F534'"
        |> CSS.descendantClass "list-item" (Properties.custom "list-style-type" "'\\\\1F535'")


svgCircle : CSS
svgCircle =
    CSS.css "svg-circle"
        |> Properties.custom "fill" "#1293D8"
