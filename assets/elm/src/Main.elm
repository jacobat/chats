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
  MyPorts.updates Update

type alias Model = Int

type Msg = Increment | Decrement | Update Int

update msg model =
  case msg of
    Update n ->
      (n, Cmd.none)

    Increment ->
      let
          value = model + 1
      in
          (value, check "incr")

    Decrement ->
      let
          value = model - 1
      in
          (value, check "decr")

view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]


init = (1, Cmd.none)
