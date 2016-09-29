import Test
import Test.Runner.Html
import CharacterTest
import AttributesTest
import AffiliationTest
import SkillTest
import XpTableTests


all : Test.Test
all =
  Test.concat
    [ CharacterTest.all
    , AttributesTest.all
    , AffiliationTest.all
    , SkillTest.all
    , XpTableTests.all
    ]

main : Program Never
main =
  all |> Test.Runner.Html.run
