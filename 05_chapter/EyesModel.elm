module EyesModel where


type alias Size = (Int, Int)
type alias MousePosition = (Int, Int)
type alias PupilLocation = (Float, Float)


-- hand-wavey math stuffs
calculateP : (Float, Float) -> (Float, Float) -> (Float, Float) -> (Float, Float)
calculateP (xR, yR) (xC, yC) (xM, yM) =
    let (xA, yA) =
            if (yM/xM < yC/xC)
                then (xC,xC*yM/xM)
                else (xM*yC/yM,yC)
        xB = xR*yR / sqrt (yR^2+(xR*yM/xM)^2)
        yB = xR*yR / sqrt (xR^2+(yR*xM/yM)^2)
        xP = xB*xM/xA
        yP = yB*yM/yA
    in
        (xP,yP)


-- if I could math I would pull out the common code here...
leftPupil : Size  -> MousePosition -> PupilLocation
leftPupil (w, h) (x, y) =
  let xC = (toFloat w)/4
      yC = (toFloat h)/2
      xM = toFloat x
      yM = (toFloat (h-y)) - yC
      xR = xC*9/10
      yR = yC*9/10
      sign x = x / (abs x)
      (xPl,yPl) =
          if xM >= xC
              then calculateP (xR,yR) (3*xC,yC) (xM-xC,yM)
                       |> \(xP,yP) -> (xP-xC, yP * sign yM)
              else calculateP (xR,yR) (xC,yC) (-xM+xC,yM)
                       |> \(xP,yP) -> (-xP-xC, yP * sign yM)
  in
      (xPl,yPl)


rightPupil : Size  -> MousePosition -> PupilLocation
rightPupil (w, h) (x, y) =
  let xC = (toFloat w)/4
      yC = (toFloat h)/2
      xM = toFloat x
      yM = (toFloat (h-y)) - yC
      xR = xC*9/10
      yR = yC*9/10
      sign x = x / (abs x)
      (xPr,yPr) =
          if xM >= 3*xC
              then calculateP (xR,yR) (xC,yC) (xM-3*xC,yM)
                       |> \(xP,yP) -> (xP+xC, yP * sign yM)
              else calculateP (xR,yR) (3*xC,yC) (3*xC-xM,yM)
                  |> \(xP,yP) -> (xC-xP, yP * sign yM)
  in
      (xPr,yPr)
