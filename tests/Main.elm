import Test
import Test.Runner.Html
import CharacterTest
import AttributesTest


all : Test.Test
all =
  Test.concat
    [ CharacterTest.all
    , AttributesTest.all
    ]

main : Program Never
main =
  all |> Test.Runner.Html.run
