module Main exposing (..)

import Browser
import Html exposing (Html, div, h1, img, text, textarea)
import Html.Attributes exposing (id, required, spellcheck, src, value)
import Html.Events exposing (onInput)



---- MODEL ----


type alias Model =
    { textareaValue : String }


init : ( Model, Cmd Msg )
init =
    ( { textareaValue = "" }, Cmd.none )



---- UPDATE ----


type Msg
    = UpdateTextarea String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateTextarea v ->
            ( { model | textareaValue = v }, Cmd.none )



---- VIEW ----


view : Model -> Browser.Document Msg
view model =
    { title = "My application"
    , body =
        [ div []
            [ img [ src "/logo.svg" ] []
            , h1 [] [ text "Your Elm App is working!" ]
            , textarea [ spellcheck False, required True, id "my-textarea", onInput UpdateTextarea ] []
            ]
        ]
    }



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.document
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
