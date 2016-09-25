import Test
import Test.Runner.Html
import CharacterTest
import AttributesTest
import AffiliationTest


all : Test.Test
all =
  Test.concat
    [ CharacterTest.all
    , AttributesTest.all
    , AffiliationTest.all
    ]

main : Program Never
main =
  all |> Test.Runner.Html.run
