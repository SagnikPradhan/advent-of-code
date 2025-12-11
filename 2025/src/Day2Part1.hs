module Day2Part1 where

import Data.Text qualified as T

solve :: T.Text -> T.Text
solve input = do
  T.pack $ show $ sum $ concatMap getInvalid $ T.splitOn "," $ T.strip input

getInvalid :: T.Text -> [Int]
getInvalid range = do
  let (start, end) = parseRange $ map tread $ T.splitOn "-" range
  filter hasRepeated [start .. end]

parseRange :: [Int] -> (Int, Int)
parseRange [a, b] = (a, b)
parseRange _ = (0, 0)

hasRepeated :: Int -> Bool
hasRepeated number = halfLen * 2 == T.length string && firstStr == lastStr
  where
    string = T.pack $ show number
    halfLen = T.length string `div` 2
    firstStr = T.take halfLen string
    lastStr = T.takeEnd halfLen string

tread :: T.Text -> Int
tread a = read $ T.unpack a
