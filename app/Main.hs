{-
-- EPITECH PROJECT, 2025
-- rush1
-- File description:
-- caca
-}

module Main where

import qualified Utils (isSorted, computePS, bothNothingIfNothing, areAllHere,
                       readInt)
import System.Exit (exitWith, ExitCode(ExitFailure))
import System.Environment (getArgs)

computeExit :: Maybe ([Int], [Int]) -> IO ()
computeExit Nothing = putStrLn  "OK"
computeExit (Just tuples) = putStrLn $ "KO: " ++ show tuples

checkOutput :: Maybe ([Int], [Int]) -> IO()
checkOutput Nothing = exitWith (ExitFailure 84)
checkOutput val = computeExit $ Utils.isSorted val

main :: IO ()
main = do
    instr <- getLine
    args <- getArgs
    checkOutput $ Utils.computePS (words instr)
     $ Utils.bothNothingIfNothing (Utils.areAllHere
                                   (fmap Utils.readInt args), [])
