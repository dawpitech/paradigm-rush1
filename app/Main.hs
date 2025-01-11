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

main :: IO ()
main = do
    args <- getArgs
    computeExit $ Utils.computePS (words "sa pb pb pb sa pa pa pa") ([2,1,3,6,5,8], [])
