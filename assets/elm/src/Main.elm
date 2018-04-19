import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import MyPorts exposing(check)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

type alias Model = Int

type Msg = Increment | Decrement

update msg model =
  case msg of
    Increment ->
      let
          value = model + 1
      in
          (value, check (toString value))

    Decrement ->
      let
          value = model - 1
      in
          (value, check (toString value))

view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]


init = (1, Cmd.none)
