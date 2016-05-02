module MouseSignals1 where


import Mouse
import Signal exposing (Signal, map)
import Graphics.Element exposing (Element, show)


main : Signal Element
main = map show Mouse.x
