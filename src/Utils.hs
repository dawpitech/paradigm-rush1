{-
-- EPITECH PROJECT, 2025
-- rush1
-- File description:
-- uwu
-}

module Utils where

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
