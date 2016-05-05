module EyesView where


import Color exposing (Color, black, white)
import Graphics.Collage exposing (Form, collage, oval, filled, group, move, moveX)
import Graphics.Element exposing (Element)
import EyesModel exposing (Size, PupilLocation)


coloredOval : Color -> Float -> Float -> Form
coloredOval c w h = oval w h |> filled c


border : Float -> Float -> Form
border w h = 
    let 
        outer = coloredOval black w h 
        inner = coloredOval white (w * 9/10) (h * 9/10) 
    in 
        group [ outer, inner ] 


pupil : Float -> Float -> Form
pupil w h = coloredOval black (w/5) (h/5)


eyesView : Size -> PupilLocation -> PupilLocation -> Element
eyesView (w, h) l r = 
    let 
        eyeWidth = (toFloat w) / 2
        eyeOffset = eyeWidth / 2
        eyeHeight = toFloat h
    in
        [
            border eyeWidth eyeHeight |> moveX -eyeOffset
            ,pupil eyeWidth eyeHeight |> move l
            ,border eyeWidth eyeHeight |> moveX eyeOffset
            ,pupil eyeWidth eyeHeight |> move r
        ]
            |> collage w h


{--
main : Element
main = eyesView (700, 500) (-50, -50) (100, 100)
--}
