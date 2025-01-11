{-
-- EPITECH PROJECT, 2025
-- rush1
-- File description:
-- uwu
-}

module Utils (isSorted, computePS, fSa, fPa, fRa, fRra) where

fSa :: ([Int], [Int]) -> ([Int], [Int])
fSa ([], b) = ([], b)
fSa ([a], b) = ([a], b)
fSa (a:x:as, b) = (x:a:as, b)

fSb :: ([Int], [Int]) -> ([Int], [Int])
fSb (a, b) = (av, bv) where (bv, av) = fSa (b, a)

fSc :: ([Int], [Int]) -> ([Int], [Int])
fSc (a, b) = fSb $ fSa (a, b)

fPa :: ([Int], [Int]) -> ([Int], [Int])
fPa (a, []) = (a, [])
fPa (a, b:bs) = (b:a, bs)

fPb :: ([Int], [Int]) -> ([Int], [Int])
fPb (a, b) = (av, bv) where (bv, av) = fPa (b, a)

fRa :: ([Int], [Int]) -> ([Int], [Int])
fRa ([], b) = ([], b)
fRa ([a], b) = ([a], b)
fRa (a:as, b) = (as++[a], b)

fRb :: ([Int], [Int]) -> ([Int], [Int])
fRb (a, b) = (av, bv) where (bv, av) = fRa (b, a)

fRr :: ([Int], [Int]) -> ([Int], [Int])
fRr (a, b) = fRb $ fRa (a, b)

fRra :: ([Int], [Int]) -> ([Int], [Int])
fRra ([], b) = ([], b)
fRra ([a], b) = ([a], b)
fRra (a, b) = (([last a] ++ (init a)), b)

fRrb :: ([Int], [Int]) -> ([Int], [Int])
fRrb (a, b) = (av, bv) where (bv, av) = fRra (b, a)

fRrr :: ([Int], [Int]) -> ([Int], [Int])
fRrr (a, b) = fRrb $ fRra (a, b)

isSorted :: Maybe ([Int], [Int]) -> Maybe ([Int], [Int])
isSorted Nothing = Nothing
isSorted (Just ([], [])) = Nothing
isSorted (Just ([_], [])) = Nothing
isSorted (Just (ea:eb:es, [])) | ea <= eb = isSorted $ Just (eb:es, [])
                              | otherwise = Just (eb:es, [])
isSorted (Just (a, b)) = Just (a, b)

computePS :: [String] -> Maybe ([Int], [Int]) -> Maybe ([Int], [Int])
computePS [] (Just (a, b)) = Just (a, b)
computePS _ (Just ([], b)) = Just ([], b)
computePS ("sa":ls) (Just (a, b)) = computePS ls $ Just (fSa (a, b))
computePS ("sb":ls) (Just (a, b)) = computePS ls $ Just (fSb (a, b))
computePS ("sc":ls) (Just (a, b)) = computePS ls $ Just (fSc (a, b))
computePS ("pa":ls) (Just (a, b)) = computePS ls $ Just (fPa (a, b))
computePS ("pb":ls) (Just (a, b)) = computePS ls $ Just (fPb (a, b))
computePS ("ra":ls) (Just (a, b)) = computePS ls $ Just (fRa (a, b))
computePS ("rb":ls) (Just (a, b)) = computePS ls $ Just (fRb (a, b))
computePS ("rr":ls) (Just (a, b)) = computePS ls $ Just (fRr (a, b))
computePS ("rra":ls) (Just (a, b)) = computePS ls $ Just (fRra (a, b))
computePS ("rrb":ls) (Just (a, b)) = computePS ls $ Just (fRrb (a, b))
computePS ("rrr":ls) (Just (a, b)) = computePS ls $ Just (fRrr (a, b))
computePS _ _ = Nothing 
