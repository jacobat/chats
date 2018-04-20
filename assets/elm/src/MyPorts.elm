port module MyPorts exposing (..)

port check : String -> Cmd msg

port updates : (Int -> msg) -> Sub msg

