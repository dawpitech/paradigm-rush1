{-
-- EPITECH PROJECT, 2025
-- rush1
-- File description:
-- caca
-}

module MyLib (someFunc, isSorted) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

isSorted :: Maybe ([Int], [Int]) -> Maybe ([Int], [Int])
isSorted Nothing = Nothing
isSorted (Just ([], [])) = Nothing
isSorted (Just ([_], [])) = Nothing
isSorted (Just (ea:eb:es, [])) | ea <= eb = isSorted $ Just (eb:es, [])
                              | otherwise = Just (eb:es, [])
isSorted (Just (a, b)) = Just (a, b)
