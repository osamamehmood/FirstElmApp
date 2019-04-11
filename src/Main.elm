import Browser
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (style, type_)

main = 
    Browser.sandbox {init = { task = [], taskBox = ""}, update = update, view = view}


type Msg = AddTask | UpdateTaskBox String

update msg model = 
    case msg of 
        AddTask -> model
        UpdateTaskBox string -> { model | taskBox = string }


view model =
    div []
        [ h1 
            []
            [ text "My Todo List" ]
        , input 
            [ type_ "text",
              onInput UpdateTaskBox
            ]
            []
        , button
            [ onClick AddTask
            ]
            [ text "add" ]
        ]

