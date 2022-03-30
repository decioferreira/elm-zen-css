port module Main exposing (convertToCss, convertToProd, main, resultCss, resultProd)

import Elm.Syntax.Node exposing (Node(..))
import Helpers
import SourceToCss
import SourceToProd



-- PORTS


port convertToCss : (String -> msg) -> Sub msg


port resultCss : String -> Cmd msg


port convertToProd : (Helpers.ProdData -> msg) -> Sub msg


port resultProd : String -> Cmd msg



-- MAIN


main : Program Flags Model Msg
main =
    Platform.worker
        { init = init
        , update = update
        , subscriptions = subscriptions
        }


type alias Flags =
    ()



-- MODEL


type alias Model =
    ()


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( (), Cmd.none )



-- UPDATE


type Msg
    = ConvertToCss String
    | ConvertToProd Helpers.ProdData


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ConvertToCss src ->
            ( model, resultCss (SourceToCss.sourceToCss src) )

        ConvertToProd data ->
            ( model, resultProd (SourceToProd.sourceToProd data) )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ convertToCss ConvertToCss
        , convertToProd ConvertToProd
        ]
