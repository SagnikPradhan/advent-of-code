module Day2Part2 where

import Data.Text qualified as T

solve :: T.Text -> T.Text
solve input = do
  T.pack $ show $ sum $ concatMap getInvalid $ T.splitOn "," $ T.strip input

getInvalid :: T.Text -> [Int]
getInvalid range = do
  let (start, end) = parseRange $ map tread $ T.splitOn "-" range
  filter hasAnyRepeated [start .. end]

parseRange :: [Int] -> (Int, Int)
parseRange [a, b] = (a, b)
parseRange _ = (0, 0)

hasAnyRepeated :: Int -> Bool
hasAnyRepeated number =
  any (hasRepeatedOfLen text) (reverse [1 .. (T.length text `div` 2)])
  where
    text = T.pack $ show number

hasRepeatedOfLen :: T.Text -> Int -> Bool
hasRepeatedOfLen text len =
  all (== T.take len text) $ T.chunksOf len text

tread :: T.Text -> Int
tread a = read $ T.unpack a
