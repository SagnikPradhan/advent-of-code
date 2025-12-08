module Day1Part2Spec where

import Day1Part2 qualified as Day
import Test.Hspec

spec :: Spec
spec = do
  -- no movement over 100
  it "should return 0 for three small left moves" $ do
    Day.solve "L1\nL2\nL3" `shouldBe` "0"

  -- counts negative movements correctly
  it "counts only left moves" $ do
    Day.solve "L1\nL49\nL100" `shouldBe` "2"

  it "counts extremely large movements" $ do
    Day.solve "R1000" `shouldBe` "10"

  it "should solve the example" $ do
    Day.solve "L68\nL30\nR48\nL5\nR60\nL55\nL1\nL99\nR14\nL82" `shouldBe` "6"

  -- hitting 2 by wrapping around left
  it "wraps left around and hits 0" $ do
    -- 50 -> L51 = 50 - 51 = -1, 1 hit
    -- then L100 = 99 - 100 = -1, 1 hit
    Day.solve "L51\nL100" `shouldBe` "2"

  -- hitting 0 exactly multiple times with left moves
  it "counts multiple left hits in a row" $ do
    -- 50 -> L50 = 0 (1)
    -- 0 -> L100 = 0 (1)
    -- 0 -> L200 = 0 (2)
    Day.solve "L50\nL100\nL200" `shouldBe` "4"

  -- right wrap-around but still hitting 0
  it "wraps right around and hits 0" $ do
    -- 50 -> R50 = 100 -> wrap to 0 (1)
    -- 0 -> R100 = 100 -> wrap to 0 (2)
    Day.solve "R50\nR100" `shouldBe` "2"

  -- alternating left/right hitting zero several times
  it "counts multiple hits in mixed directions" $ do
    -- 50 -> L50 = 0 (1)
    -- 0 -> R100 = 0 (2)
    -- 0 -> L100 = 0 (3)
    -- 0 -> R200 = 0 (4)
    Day.solve "L50\nR100\nL100\nR200" `shouldBe` "5"

  -- movement that never changes because distance is 0
  it "treats zero-distance moves as no movement" $ do
    Day.solve "L0\nR0\nL0" `shouldBe` "0"

  -- hitting zero on the first move directly
  it "hits zero immediately" $ do
    Day.solve "L50" `shouldBe` "1"

  -- counts constant 0 hits
  it "counsts constant 0 hits" $ do
    Day.solve "L50\nR50\nL50\nR50\nL50\nR50\nL50" `shouldBe` "4"
