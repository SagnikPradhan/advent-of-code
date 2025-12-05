import qualified Day1Spec
import Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Day1" Day1Spec.spec
