module FibonacciBars where


import Fibonacci exposing (fibonacciWithIndices)
import Graphics.Element exposing (Element, show, flow, down, right)
import Graphics.Collage exposing (collage, rect, filled, Shape, Form)
import Color exposing (..)
import Array exposing (fromList, get, length)
import List exposing (map)
import Maybe exposing (withDefault)


colorize : Int -> Shape -> Form
colorize i =
    let colors = [ red, orange, yellow, green, blue, purple ] |> fromList
    in
        colors
            |> get (i % (length colors))
            |> withDefault lightPurple
            |> filled


makeRect : Int -> Int -> Element
makeRect i n =
    flow right [
        toFloat n * 20
            |> flip rect 20
            |> colorize i 
            |> flip (::) []
            |> collage (n*20) 20
        ,show n
    ]


main : Element
main =
    fibonacciWithIndices 10
        |> map (\n -> uncurry makeRect n)
        |> flow down
