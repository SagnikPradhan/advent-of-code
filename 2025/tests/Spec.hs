import Day1Part1Spec qualified
import Day1Part2Spec qualified
import Day2Part1Spec qualified
import Day2Part2Spec qualified
import Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Day 1 Part 1" Day1Part1Spec.spec
  describe "Day 1 Part 2" Day1Part2Spec.spec
  describe "Day 2 Part 1" Day2Part1Spec.spec
  describe "Day 2 Part 2" Day2Part2Spec.spec
