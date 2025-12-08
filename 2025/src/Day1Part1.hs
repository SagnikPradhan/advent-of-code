module Day1Part1 (solve) where

import Data.Text qualified as T

initPos :: Int
initPos = 50

solve :: T.Text -> T.Text
solve input = do
  let commands = reverse $ T.splitOn "\n" $ T.strip input
  let (_, wraps) = foldr advancePosAndCountWraps (initPos, 0 :: Int) commands
  T.pack $ show wraps

advancePosAndCountWraps :: (Num b) => T.Text -> (Int, b) -> (Int, b)
advancePosAndCountWraps text (currentPos, wraps)
  | nextPos == 0 = (nextPos, wraps + 1)
  | otherwise = (nextPos, wraps)
  where
    nextPos = mod (resolvePos text + currentPos) 100

resolvePos :: T.Text -> Int
resolvePos (T.stripPrefix "R" -> Just value) = tread value
resolvePos (T.stripPrefix "L" -> Just value) = -(tread value)
resolvePos _ = 0

tread :: T.Text -> Int
tread a = read $ T.unpack a
