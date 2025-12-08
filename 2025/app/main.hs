module Main where

import Configuration.Dotenv qualified as Config
import Data.Text qualified as T
import Day1Part1 qualified
import Day1Part2 qualified
import Shared qualified
import System.Environment qualified as Env

solveForDay :: Integer -> Integer -> T.Text -> T.Text
solveForDay 1 1 v = Day1Part1.solve v
solveForDay 1 2 v = Day1Part2.solve v
solveForDay _ _ _ = error "Unsupported question"

main :: IO ()
main = do
  Config.loadFile Config.defaultConfig

  [dayStr, partStr] <- Env.getArgs
  let day = read dayStr :: Integer
  let part = read partStr :: Integer

  input <- Shared.getInput day
  let solution = solveForDay day part input

  print input
  print solution

-- TODO: Fix submission code
-- (_, result) <- Shared.submitAnswer day part (T.pack $ show solution)
-- print result
