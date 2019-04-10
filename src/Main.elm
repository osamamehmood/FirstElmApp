import Browser
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (style, type_)

main = 
    Browser.sandbox {init = [], update = update, view = view}


type Msg = AddTask

update msg model = 
    case msg of 
        AddTask -> model


view model =
    div []
        [ h1 
            []
            [ text "My Todo List" ]
        , input 
            [ type_ "text" 
            ]
            []
        , button
            [ onClick AddTask
            ]
            [ text "add" ]
        ]

