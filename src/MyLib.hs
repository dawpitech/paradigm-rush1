{-
-- EPITECH PROJECT, 2025
-- rush1
-- File description:
-- caca
-}

module MyLib (someFunc, isSorted, computePS) where
import Utils (fSa, fSb, fSc, fPa, fPb, fRa, fRb, fRr, fRra, fRrb, fRrr)

someFunc :: IO ()
someFunc = putStrLn "someFunc"

isSorted :: Maybe ([Int], [Int]) -> Maybe ([Int], [Int])
isSorted Nothing = Nothing
isSorted (Just ([], [])) = Nothing
isSorted (Just ([_], [])) = Nothing
isSorted (Just (ea:eb:es, [])) | ea <= eb = isSorted $ Just (eb:es, [])
                              | otherwise = Just (eb:es, [])
isSorted (Just (a, b)) = Just (a, b)

computePS :: [String] -> ([Int], [Int]) -> Maybe ([Int], [Int])
computePS [] (a, b) = Just (a, b)
computePS _ ([], b) = Just ([], b)
computePS (" ":ls) (a, b) = computePS ls (a, b)
computePS ("sa":ls) (a, b) = computePS ls (fSa (a, b))
computePS _ a = Just a
