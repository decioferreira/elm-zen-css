module Stylesheet exposing (button, main, number)

import CSS exposing (CSS)
import Html exposing (Html)


main : Html msg
main =
    [ button
    , number
    ]
        |> CSS.toString
        |> Html.text


button : CSS
button =
    CSS.css "button"
        |> CSS.background "black"
        |> CSS.color "white"


number : CSS
number =
    CSS.css "number"
        |> CSS.color "red"
