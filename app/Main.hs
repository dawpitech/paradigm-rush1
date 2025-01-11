{-
-- EPITECH PROJECT, 2025
-- rush1
-- File description:
-- caca
-}

module Main where

import qualified Utils (isSorted, computePS)
import System.Environment()
import System.Exit()

computeExit :: Maybe ([Int], [Int]) -> IO ()
computeExit Nothing = putStrLn  "OK"
computeExit (Just tuples) = putStrLn $ "KO: " ++ show tuples

checkOutput :: Maybe([Int], [Int]) -> IO()
checkOutput Nothing = exitWith (ExitFailure 84)
checkOutput val = computeExit $ Utils.isSorted val

main :: IO ()
main = do
    instr <- getLine
    checkOutput $ Utils.computePS (words instr) ([2,1,3,6,5,8], [])
