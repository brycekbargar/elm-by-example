module Eyes where

import EyesView exposing(eyesView)
import EyesModel exposing(Size, MousePosition, leftPupil, rightPupil)
import Window
import Mouse
import Signal exposing (Signal, map2)
import Graphics.Element exposing (Element)


eyes : Size -> MousePosition -> Element
eyes s l = eyesView s (leftPupil s l) (rightPupil s l)


main : Signal Element
main = map2 eyes Window.dimensions Mouse.position
