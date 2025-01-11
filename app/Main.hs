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

checkOutput :: Maybe([Int], [Int]) -> IO()
checkOutput Nothing = exitWith (ExitFailure 84)
checkOutput val = computeExit $ Utils.isSorted val

main :: IO ()
main = do
    args <- getArgs
    checkArgs args
    checkOutput $ Utils.computePS ["sa", "pb", "pb", "pb", "sa", "pa", "pa", "pa"] ([2,1,3,6,5,8], [])
