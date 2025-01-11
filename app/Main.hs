{-
-- EPITECH PROJECT, 2025
-- rush1
-- File description:
-- caca
-}

module Main where

import qualified Utils (isSorted, computePS)
import System.Environment (getArgs)
import System.Exit

computeExit :: Maybe ([Int], [Int]) -> IO ()
computeExit Nothing = putStrLn  "OK"
computeExit (Just tuples) = putStrLn $ "KO: " ++ show tuples

checkArgs :: [String] -> IO()
checkArgs args | (length args) /= 1 = exitWith (ExitFailure 84)
checkArgs _ = return ()

main :: IO ()
main = do
    args <- getArgs
    checkArgs args
    computeExit $ Utils.computePS ["sa pb pb pb sa pa pa pa"] ([2,1,3,6,5,8], [])
    computeExit $ Utils.isSorted $ Just ([6, 5, 8], [3, 2, 1])
    computeExit $ Utils.isSorted $ Just ([], [1, 2, 3, 4 ,5])
    computeExit $ Utils.isSorted $ Just ([1,2,3,4,5,6], [])
