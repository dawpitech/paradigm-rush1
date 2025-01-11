{-
-- EPITECH PROJECT, 2025
-- unit test
-- File description:
-- uwu
-}

module Main (main) where
import qualified Utils
import Test.HUnit
import qualified System.Exit

tesT1 :: Test
tesT1 = TestCase (assertEqual "True" True (Utils.computePS ["sa"] ([1,2,3,4,5,6], []) /= Nothing))

tesT2 :: Test
tesT2 = TestCase (assertEqual "True" True (Utils.isSorted (Utils.computePS
         ["sa", "pb", "pb","pb", "sa", "pa", "pa",
          "pa"] ([2,1,3,6,5,8], [])) == Nothing))

tesT3 :: Test
tesT3 = TestCase (assertEqual "True" True (Utils.isSorted (Utils.computePS
         ["sa", "sb", "sc","pa", "pb", "ra", "rb", "rr", "rra", "rrb",
          "rrr"] ([2,1,3,6,5,8], [])) /= Nothing))
  
tesT4 :: Test
tesT4 = TestCase (assertEqual "True" True (Utils.computePS ["sa"] ([], []) /= Nothing))
  
tesT5 :: Test
tesT5 = TestCase (assertEqual "True" True (Utils.computePS [] ([1,2,6,4,5], []) /= Nothing))
  
tesT6 :: Test
tesT6 = TestCase (assertEqual "True" True (Utils.computePS ["sq"] ([5,6,9,8,4,2], []) == Nothing))
  
tesT7 :: Test
tesT7 = TestCase (assertEqual "True" True (Utils.isSorted Nothing == Nothing))
  
tesT8 :: Test
tesT8 = TestCase (assertEqual "True" True (Utils.isSorted (Just([], [])) == Nothing))
  
tesT9 :: Test
tesT9 = TestCase (assertEqual "True" True (Utils.fSa ([1], [1,2]) == ([1], [1,2])))
  
tesT10 :: Test
tesT10 = TestCase (assertEqual "True" True (Utils.fPa ([1,2], []) == ([1,2], [])))
  
tesT11 :: Test
tesT11 = TestCase (assertEqual "True" True (Utils.fRa ([], [1,2]) == ([], [1,2])))
  
tesT12 :: Test
tesT12 = TestCase (assertEqual "True" True (Utils.fRa ([1], [1,2,3]) == ([1], [1,2,3])))
  
tesTs :: Test
tesTs = TestList [TestLabel "Already sorted, valid input" tesT1,
                 TestLabel "A few instructions, results in sorted list, valid input" tesT2,
                 TestLabel "All instructions, resulsts in non sorted list, valid input" tesT3,
                 TestLabel "Empty A List" tesT4,
                 TestLabel "Empty instruction String" tesT5,
                 TestLabel "Invalid instruction" tesT6,
                 TestLabel "isSorted with Nothing" tesT7,
                 TestLabel "isSorted with empty lists" tesT8,
                 TestLabel "sa with single value A list" tesT9,
                 TestLabel "pa with empty B list" tesT10,
                 TestLabel "ra with empty A list" tesT11,
                 TestLabel "ra with single value A list" tesT12]

main :: IO ()
main = do
    result <- runTestTT tesTs
    if failures result > 0 then System.Exit.exitFailure else System.Exit.exitSuccess
