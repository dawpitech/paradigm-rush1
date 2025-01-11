module MyLib (someFunc, isSorted) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

isSorted :: Maybe ([Int], [Int]) -> Maybe ([Int], [Int])
isSorted (Just ([], [])) = Nothing
isSorted (Just (a, [])) = return (a, [])
isSorted (Just (a, ea:eb:es)) | ea <= eb = isSorted $ Just (a, eb:es)
                              | otherwise = Just (a, eb:es)
