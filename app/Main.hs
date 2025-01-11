{-
-- EPITECH PROJECT, 2025
-- rush1
-- File description:
-- caca
-}

module Main where

import qualified MyLib (someFunc, isSorted, computePS)
import System.Environment (getArgs)
import System.Exit
import MyLib (computePS)

computeExit :: Maybe ([Int], [Int]) -> IO ()
computeExit Nothing = putStrLn  "OK"
computeExit (Just tuples) = putStrLn $ "KO: " ++ show tuples

checkArgs :: [String] -> IO()
checkArgs args | (length args) /= 3 = exitWith (ExitFailure 84)
checkArgs _ = return ()

myNth :: [ a ] -> Int -> a
myNth [a] _ = a
myNth (a:as) 0 = a
myNth (a:as) b = myNth as (b - 1)

main :: IO ()
main = do
    args <- getArgs
    checkArgs args
    computeExit $ MyLib.isSorted $ computePS "sa pb pb pb sa pa pa pa" [2,1,3,6,5,8] []
    computeExit $ MyLib.isSorted $ Just ([6, 5, 8], [3, 2, 1])
    computeExit $ MyLib.isSorted $ Just ([], [1, 2, 3, 4 ,5])
    computeExit $ MyLib.isSorted $ Just ([1,2,3,4,5,6], [])
