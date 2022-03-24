module Main exposing (main)

import Browser
import CSS
import Classes
import Html exposing (Html)
import Html.Events as Events



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- VIEW


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.button
            [ CSS.class Classes.button
            , Events.onClick Decrement
            ]
            [ Html.text "-" ]
        , Html.div
            [ CSS.class Classes.number
            ]
            [ Html.text (String.fromInt model) ]
        , Html.button
            [ CSS.class Classes.button
            , Events.onClick Increment
            ]
            [ Html.text "+" ]
        ]
