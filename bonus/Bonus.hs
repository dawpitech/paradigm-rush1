{-
-- EPITECH PROJECT, 2025
-- rush1
-- File description:
-- uwu
-}

pushSwapInternal :: [Int] -> [Int] -> [Int]
-- pushing the first 2 numbers on the stack
pushSwapInternal (a:as) [] = pushSwapInternal as [a]
pushSwapInternal (a:as) [s] = pushSwapInternal as ([s] ++ [a])
pushSwapInternal _ s = s

computeExit :: [Int] -> IO()
computeExit a = print a 

myPushSwap :: [Int] -> IO()
myPushSwap a = computeExit (pushSwapInternal a [])
