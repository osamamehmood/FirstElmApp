import Browser
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (style, type_)

main : Program () (Model) Msg
main = 
    Browser.sandbox {init = { tasks = [], taskBox = "" }, update = update, view = view}


type Msg = AddTask | UpdateTextBox String

type alias Model =
    { tasks : List String
    , taskBox : String 
    }


update msg model = 
    case msg of 
    AddTask -> model 

    UpdateTextbox string -> { model | taskBox = string }

view model = 
    div[]
        [
            h1
                []
                [
                    text "To Do list" 
                ]
                , input 
                    [
                        type_ "text",
                        onInput UpdateTextBox
                    ]
                    []
                , button 
                    []
                    [
                        text "Add"
                    ]
        ]






-- import Browser
-- import Html exposing (..)
-- import Html.Events exposing (onClick, onInput)
-- import Html.Attributes exposing (style, type_)


-- main : Program () (Model) Msg
-- main = 
--     Browser.sandbox {init = { tasks = [], taskBox = "" }, update = update, view = view}

-- type Msg 
--     = AddTask 
--     | UpdateTextbox String


-- type alias Model =
--     { tasks : List String
--     , taskBox : String 
--     }


-- update : Msg -> Model -> Model
-- update msg model = 
--     case msg of 
--         AddTask -> model

--         UpdateTextbox string -> { model | taskBox = string }


-- view : Model -> Html Msg
-- view model =
--     div []
--         [ h1 
--             []
--             [ text "My Todo List" ]
--         , input 
--             [ type_ "text" 
--             , onInput UpdateTextbox
--             ]
--             []
--         , button
--             [ onClick AddTask
--             ]
--             [ text "add" ]
--         ]