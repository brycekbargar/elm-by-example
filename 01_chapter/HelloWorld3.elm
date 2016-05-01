module HellowWorld3 where


import Color exposing (lightPurple)
import Graphics.Element exposing (..)
import Text as T

addPizzazz : T.Text -> T.Text
addPizzazz =
    T.color lightPurple

main : Graphics.Element.Element
main =
    T.fromString "Hello, World!"
        |> addPizzazz
        |> T.italic
        |> T.bold
        |> T.height 60
        |> leftAligned
