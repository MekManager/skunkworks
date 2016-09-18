import Test
import Test.Runner.Html
import Character


main : Program Never
main =
  Character.all |> Test.Runner.Html.run
