module Shared (getInput, submitAnswer) where

import qualified Advent as A
import qualified Control.Exception
import qualified Data.Text as T
import qualified System.Environment

getDefaults :: IO A.AoCOpts
getDefaults = do
  userRepo <- System.Environment.getEnv "AOC_USER_GITHUB"
  userEmail <- System.Environment.getEnv "AOC_USER_EMAIL"
  sessionKey <- System.Environment.getEnv "AOC_USER_SESSION_KEY"
  let userAgent = A.AoCUserAgent (T.pack userRepo) (T.pack userEmail)
  return $ A.defaultAoCOpts userAgent 2025 sessionKey

getInput :: Integer -> IO T.Text
getInput d = do
  options <- getDefaults
  result <- A.runAoC options $ A.AoCInput (A.mkDay_ d)
  either Control.Exception.throwIO pure result

submitAnswer :: Integer -> Integer -> T.Text -> IO (T.Text, A.SubmitRes)
submitAnswer day partInt answer = do
  let part = if partInt == 1 then A.Part1 else A.Part2
  options <- getDefaults
  result <- A.runAoC options $ A.AoCSubmit (A.mkDay_ day) part (T.unpack answer)
  either Control.Exception.throwIO pure result
