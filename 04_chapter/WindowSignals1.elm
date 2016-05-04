module WindowSignals1 where


import Window
import Signal as S
import List exposing (map)
import Text exposing (fromString)
import Graphics.Element exposing(Element, leftAligned, flow, down)


display : (Int, Int) -> Int -> Int -> Element
display (dw, dh) w h = [
        "Window.dimensions.width: " ++ toString dw
        ,"Window.dimensions.height: " ++ toString dh
        ,"Window.width: " ++ toString w
        ,"Window.height: " ++ toString h
    ]
        |> map (leftAligned << fromString)
        |> flow down


main : Signal Element
main =
    display
        |> flip(S.map) Window.dimensions
        |> S.map2 (|>) Window.width
        |> S.map2 (|>) Window.height
