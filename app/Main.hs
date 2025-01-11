module Main where

import qualified MyLib (someFunc, isSorted)
import System.Environment (getArgs)

computeExit :: Maybe ([Int], [Int]) -> IO ()
computeExit Nothing = putStrLn  "OK"
computeExit (Just tuples) = putStrLn $ "KO: " ++ show tuples

main :: IO ()
main = do
    args <- getArgs
    computeExit $ MyLib.isSorted $ Just ([6, 5, 8], [3, 2, 1])
    computeExit $ MyLib.isSorted $ Just ([], [1, 2, 3, 4 ,5])
    putStrLn "Hello, Haskell!"
    MyLib.someFunc
