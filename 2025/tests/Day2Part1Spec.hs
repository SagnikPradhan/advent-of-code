module Day2Part1Spec where

import Day2Part1 qualified as Day
import Test.Hspec

spec :: Spec
spec = do
  -- base case example
  it "should solve the base case example" $ do
    Day.solve "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124" `shouldBe` "1227775554"
