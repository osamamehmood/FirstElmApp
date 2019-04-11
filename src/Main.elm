import Browser
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (style, type_, value)



main : Program() (Model) Msg
main = 
    Browser.sandbox { init = { tasksList = [], taskBox = ""}, update = update, view = view }


type Msg = AddTask String | UpdateTaskBox String

type alias Model = 
    { tasksList : List String
    , taskBox : String
    }

update : Msg -> Model -> Model
update msg model = 
    case msg of 
        AddTask string->  { model | tasksList = string :: model.tasksList, taskBox = ""}
        UpdateTaskBox string -> { model | taskBox = string } 


renderTasksItem : String -> Html Msg   
renderTasksItem item = 
    li 
        []
        [ input 
            [ type_ "checkbox"]
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
