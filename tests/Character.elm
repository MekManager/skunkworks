module Character exposing (all)


import Test exposing (..)
import Expect exposing (..)


all : Test
all =
  Test.concat
    [ basics ]

basics : Test
basics =
  describe "A Character"
    [ test "starts with 5000 XP" <|
        \_ ->
          5000 `equal` 5000
    ]
