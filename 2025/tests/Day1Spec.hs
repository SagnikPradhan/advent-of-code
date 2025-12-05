module Day1Spec where

import qualified Day1
import Test.Hspec

spec :: Spec
spec = do
  -- no movement over 100
  it "should return 0 for three small left moves" $ do
    Day1.solve "L1\nL2\nL3" `shouldBe` "0"

  -- landing exactly on 0 by a single right move of 100
  it "counts a single right move of 100 as 1 hit" $ do
    Day1.solve "R100" `shouldBe` "1"

  -- right 50 then right 50 -> lands on 0 once (on second move)
  it "counts hitting 0 after two 50-steps (once)" $ do
    Day1.solve "R50\nR50" `shouldBe` "1"

  -- three exact full rotations -> three hits
  it "counts multiple full rotations separately" $ do
    Day1.solve "R100\nR100\nR100" `shouldBe` "3"

  -- left 100 is also a full rotation (negative direction)
  it "counts a full left rotation as a hit" $ do
    Day1.solve "L100" `shouldBe` "1"

  -- mix of rotations in both directions that each land on 0
  it "counts hits when different commands land on 0" $ do
    Day1.solve "R100\nL200" `shouldBe` "2"

  -- wrap-around that does NOT land on zero
  it "does not count when wrap-around does not land on 0" $ do
    Day1.solve "R60\nR50" `shouldBe` "0"

  -- sequence that eventually hits 0 after several moves
  it "counts a later move that returns to 0" $ do
    Day1.solve "R30\nR40\nR30" `shouldBe` "1"

  -- long moves larger than 100 (positive and negative)
  it "handles moves larger than 100 correctly" $ do
    Day1.solve "R250\nL350\nR450" `shouldBe` "1"
