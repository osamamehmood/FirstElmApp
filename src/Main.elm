import Browser
import Html exposing (..)
import Html.Events exposing (onClick, onInput, onCheck)
import Html.Attributes exposing (style, type_, value, placeholder)



main : Program() (Model) Msg
main = 
    Browser.sandbox { init = { tasksList = [], taskBox = ""}, update = update, view = view }


type Msg = AddTask String | UpdateTaskBox String | ToggleTask Bool

type alias Model = 
    { tasksList : List String
    , taskBox : String
    }

update : Msg -> Model -> Model
update msg model = 
    case msg of 
        AddTask string->  { model | tasksList = string :: model.tasksList, taskBox = ""}
        UpdateTaskBox string -> { model | taskBox = string } 
        ToggleTask completed -> model


renderTasksItem : String -> Html Msg   
renderTasksItem item = 
    div 
        []
        [ input 
            [ type_ "checkbox"
            , onCheck ToggleTask
            ]
            []
        , text item
        ]


view : Model -> Html Msg
view model =
    div []
        [ h1 
            []
            [ text "My Todo List" ]
        , input 
            [ type_ "text"
            , placeholder "Add a task"
            , onInput UpdateTaskBox
            , value model.taskBox
            ]
            []
        , button
            [ onClick (AddTask model.taskBox)]
            [ text "add" ]
        , ul [] 
            (
                List.map renderTasksItem model.tasksList
            )
        ]
