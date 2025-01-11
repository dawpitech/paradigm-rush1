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
tesT1 = TestCase (assertEqual "True" True (Utils.computePS ["sa"]
                              (Just ([1,2,3,4,5,6], [])) /= Nothing))

tesT2 :: Test
tesT2 = TestCase (assertEqual "True" True (Utils.isSorted (Utils.computePS
         ["sa", "pb", "pb","pb", "sa", "pa", "pa",
          "pa"] (Just ([2,1,3,6,5,8], []))) == Nothing))

tesT3 :: Test
tesT3 = TestCase (assertEqual "True" True (Utils.isSorted (Utils.computePS
         ["sa", "sb", "sc","pa", "pb", "ra", "rb", "rr", "rra", "rrb",
          "rrr"] (Just ([2,1,3,6,5,8], []))) /= Nothing))
  
tesT4 :: Test
tesT4 = TestCase (assertEqual "True" True (Utils.computePS ["sa"]
                                           (Just ([], [])) /= Nothing))
  
tesT5 :: Test
tesT5 = TestCase (assertEqual "True" True (Utils.computePS []
                                         (Just ([1,2,6,4,5], [])) /= Nothing))
  
tesT6 :: Test
tesT6 = TestCase (assertEqual "True" True (Utils.computePS ["sq"]
                                       (Just ([5,6,9,8,4,2], [])) == Nothing))
  
tesT7 :: Test
tesT7 = TestCase (assertEqual "True" True (Utils.isSorted Nothing == Nothing))
  
tesT8 :: Test
tesT8 = TestCase (assertEqual "True" True (Utils.isSorted
                                           (Just([], [])) == Nothing))
  
tesT9 :: Test
tesT9 = TestCase (assertEqual "True" True
                  (Utils.fSa ([1], [1,2]) == ([1], [1,2])))
  
tesT10 :: Test
tesT10 = TestCase (assertEqual "True" True
                   (Utils.fPa ([1,2], []) == ([1,2], [])))
  
tesT11 :: Test
tesT11 = TestCase (assertEqual "True" True
                   (Utils.fRa ([], [1,2]) == ([], [1,2])))
  
tesT12 :: Test
tesT12 = TestCase (assertEqual "True" True
                   (Utils.fRa ([1], [1,2,3]) == ([1], [1,2,3])))
  
tesT13 :: Test
tesT13 = TestCase (assertEqual "True" True
                   (Utils.readInt ['1','2','a'] == Nothing))
  
tesT14 :: Test
tesT14 = TestCase (assertEqual "True" True
                   (Utils.readInt ['-', '1','2','3'] == (Just (-123))))
  
tesT15 :: Test
tesT15 = TestCase (assertEqual "True" True
                   (Utils.readInt ['1','a','2'] == Nothing))
  
tesT16 :: Test
tesT16 = TestCase (assertEqual "True" True
                   (Utils.bothNothingIfNothing (Nothing, [1,2]) == Nothing))
  
tesT17 :: Test
tesT17 = TestCase (assertEqual "True" True
                   (Utils.bothNothingIfNothing (Just
                        [1,3], [1,2]) == Just ([1,3], [1,2])))

tesT18 :: Test
tesT18 = TestCase (assertEqual "True" True
                   (Utils.areAllHere [] == Nothing))
  
tesT19 :: Test
tesT19 = TestCase (assertEqual "True" True
                   (Utils.areAllHere [Just 1] == Just [1]))
  
tesT20 :: Test
tesT20 = TestCase (assertEqual "True" True
                   (Utils.areAllHere [Nothing, Just 1] == Nothing))
  
tesT21 :: Test
tesT21 = TestCase (assertEqual "True" True
                   (Utils.areAllHere [Just 1, Just 2, Just 3] == Just [1,2,3]))

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
                 TestLabel "ra with single value A list" tesT12,
                 TestLabel "readInt with invalid number" tesT13,
                 TestLabel "readInt with negative number" tesT14,
                 TestLabel "readInt with middle invalid number" tesT15,
                 TestLabel "bothNothingIfNothing with Nothing" tesT16,
                 TestLabel "bothNothingIfNothing with valid input" tesT17,
                 TestLabel "areAllHere with Nothing" tesT18,
                 TestLabel "areAllHere with single value" tesT19,
                 TestLabel "areAllHere with Nothing as first value" tesT20,
                 TestLabel "areAllHere with valid values" tesT21]

main :: IO ()
main = do
    result <- runTestTT tesTs
    if failures result > 0 then System.Exit.exitFailure
      else System.Exit.exitSuccess
