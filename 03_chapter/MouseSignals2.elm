module MouseSignals2 where

import Mouse
import Signal exposing (Signal, map, map2)
import Graphics.Element exposing (Element, show)

main : Signal Element
main =
    let
        x = Mouse.x
        y = Mouse.y
    in
        map2 (,) x y |> map show
