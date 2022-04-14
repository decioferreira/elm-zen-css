module Main exposing (main)

import Browser
import CSS.Attributes
import Classes
import Html exposing (Html)
import Html.Attributes as Attributes
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
            [ CSS.Attributes.class Classes.button
            , Events.onClick Decrement
            ]
            [ Html.text "-" ]
        , Html.div
            [ CSS.Attributes.class Classes.number
            ]
            [ Html.text (String.fromInt model) ]
        , Html.button
            [ CSS.Attributes.class Classes.button
            , Events.onClick Increment
            ]
            [ Html.text "+" ]
        , Html.ul []
            [ Html.li [ CSS.Attributes.class Classes.listItem ]
                [ Html.div []
                    [ Html.text "Item 1" ]
                , Html.ul []
                    [ Html.li [ CSS.Attributes.class Classes.listItem ]
                        [ Html.text "Subitem A" ]
                    , Html.li [ CSS.Attributes.class Classes.listItem ]
                        [ Html.text "Subitem B" ]
                    ]
                ]
            , Html.li [ CSS.Attributes.class Classes.listItem ]
                [ Html.div []
                    [ Html.text "Item 2" ]
                , Html.ul []
                    [ Html.li [ CSS.Attributes.class Classes.listItem ]
                        [ Html.text "Subitem A" ]
                    , Html.li [ CSS.Attributes.class Classes.listItem ]
                        [ Html.text "Subitem B" ]
                    ]
                ]
            ]
        , Html.div []
            [ Html.input
                [ Attributes.attribute "checked" "checked"
                , Attributes.type_ "checkbox"
                , Attributes.id "example-element"
                , CSS.Attributes.class Classes.checkbox
                ]
                []
            , Html.label
                [ Attributes.id "example-label"
                , Attributes.for "example-element"
                ]
                [ Html.text "Example Label"
                ]
            ]
        ]
