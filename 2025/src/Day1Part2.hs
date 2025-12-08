module Day1Part2 (solve) where

import Data.Text qualified as T

initPos :: Int
initPos = 50

solve :: T.Text -> T.Text
solve input = do
  let turns = map resolvePos $ T.splitOn "\n" $ T.strip input
  let (hits, _) = foldl move (0, initPos) turns
  T.pack $ show hits

move :: (Int, Int) -> (Int, Int) -> (Int, Int)
move (prevHits, prevPos) (direction, value)
  -- Crossing zero mid-movement is NOT captured by modulo, so we detect:
  --  newPostInt == 0                -> landed exactly on zero
  --  newPostInt < 0 and prevPos > 0 -> passed backward through zero
  | newPostInt == 0 || (newPostInt < 0 && prevPos > 0) = (prevHits + hits + 1, newPos)
  | otherwise = (prevHits + hits, newPos)
  where
    newPostInt = prevPos + direction * value
    newPos = mod newPostInt 100
    -- Using `quot` not `div`:
    --   quot  = truncates toward 0  -> partial negative moves don't count as full wraps
    --   div   = floors negative     -> would incorrectly add a hit for e.g. -130
    hits = abs $ quot newPostInt 100

resolvePos :: T.Text -> (Int, Int)
resolvePos (T.stripPrefix "R" -> Just value) = (1, tread value)
resolvePos (T.stripPrefix "L" -> Just value) = (negate 1, tread value)
resolvePos _ = (1, 0)

tread :: T.Text -> Int
tread a = read $ T.unpack a
