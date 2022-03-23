module Stylesheet exposing (button, number)

import CSS exposing (CSS)


button : CSS
button =
    CSS.css "button"
        |> CSS.background "black"
        |> CSS.color "white"
        |> CSS.custom "border" "none"


number : CSS
number =
    CSS.css "number"
        |> CSS.color "red"
