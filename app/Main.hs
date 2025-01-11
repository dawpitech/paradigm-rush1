{-
-- EPITECH PROJECT, 2025
-- rush1
-- File description:
-- caca
-}

module Main where

import Data.Char (ord)
import qualified Utils (isSorted, computePS)
import System.Exit (exitWith, ExitCode(ExitFailure))
import System.Environment (getArgs)

computeExit :: Maybe ([Int], [Int]) -> IO ()
computeExit Nothing = putStrLn  "OK"
computeExit (Just tuples) = putStrLn $ "KO: " ++ show tuples

checkOutput :: Maybe ([Int], [Int]) -> IO()
checkOutput Nothing = exitWith (ExitFailure 84)
checkOutput val = computeExit $ Utils.isSorted val

areAllHere :: [Maybe Int] -> Maybe [Int]
areAllHere [] = Nothing
areAllHere [Just a] = Just [a]
areAllHere (Nothing:_) = Nothing
areAllHere ((Just a):bs) = areAllHere bs >>= (\r -> Just (a : r))

readInt :: [Char] -> Maybe Int
readInt []       = Nothing
readInt [c]      | ord c < 48 || ord c > 57 = Nothing
                 | otherwise = Just $ ord c - 48
readInt ('-':cs) = readInt cs >>= (\r -> Just $ r * (-1))
readInt (c:cs)   | ord c < 48 || ord c > 57 = Nothing
                 | otherwise = rest >>= (\r -> Just $ r + value)
                where
                  value = (ord c - 48) * (10 ^ length cs)
                  rest = readInt cs

bothNothingIfNothing :: (Maybe [Int], [Int]) -> Maybe ([Int], [Int])
bothNothingIfNothing (Nothing, _)  = Nothing
bothNothingIfNothing (Just a, b) = Just (a, b)

main :: IO ()
main = do
    instr <- getLine
    args <- getArgs
    checkOutput $ Utils.computePS (words instr)
      $ bothNothingIfNothing (areAllHere (fmap readInt args), [])
