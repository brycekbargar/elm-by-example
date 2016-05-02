module Fibonacci where


import List exposing ((::), reverse, map2)


fibonacci : Int -> List Int
fibonacci n = 
    let fibonacci' n k1 k2 acc =
        case n of
            0 -> acc
            _ -> fibonacci' (n-1) k2 (k1+k2) (k2::acc)
    in 
        fibonacci' n 0 1 [] |> reverse 


fibonacciWithIndices : Int -> List (Int, Int)
fibonacciWithIndices n = 
    fibonacci n |> map2 (,) [0..n]
    
