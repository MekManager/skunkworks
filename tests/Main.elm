import Test
import Test.Runner.Html
import CharacterTest


main : Program Never
main =
  CharacterTest.all |> Test.Runner.Html.run
