module Main where

import qualified Configuration.Dotenv as Config
import qualified Data.Text as T
import qualified Day1
import qualified Shared
import qualified System.Environment as Env

solveForDay :: Integer -> Integer -> T.Text -> T.Text
solveForDay 1 1 v = Day1.solve v
solveForDay _ _ _ = error "Unsupported question"

main :: IO ()
main = do
  Config.loadFile Config.defaultConfig

  [dayStr, partStr] <- Env.getArgs
  let day = read dayStr :: Integer
  let part = read partStr :: Integer

  input <- Shared.getInput day
  let solution = solveForDay day part input

  (_, result) <- Shared.submitAnswer day part (T.pack $ show solution)
  print result
