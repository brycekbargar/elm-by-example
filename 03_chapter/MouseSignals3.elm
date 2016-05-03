module MouseSignals3 where


import Mouse
import Signal as S
import List exposing (map)
import Graphics.Element exposing (Element, flow, down, leftAligned)
import Text exposing (fromString)


display : a -> b -> c -> d -> e -> f -> Element
display a b c d e f = [
        "Mouse.position: " ++ toString a
        ,"Mouse.x: " ++ toString b
        ,"Mouse.y: " ++ toString c
        ,"Mouse.clicks: " ++ toString d
        ,"Mouse.isDown: " ++ toString e
        ,"Mouse.clickPosition: " ++ toString f
    ]
        |> map (leftAligned << fromString)
        |> flow down
    

main : Signal Element
main = 
    display 
        |> flip(S.map) Mouse.position
        |> S.map2 (|>) Mouse.x
        |> S.map2 (|>) Mouse.y
        |> S.map2 (|>) Mouse.clicks
        |> S.map2 (|>) Mouse.isDown
        |> (S.map2 (|>) <| S.sampleOn Mouse.clicks Mouse.position)
