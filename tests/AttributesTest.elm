module AttributesTest exposing (all)


import Test exposing (..)
import Expect exposing (..)
import Attributes exposing (Attributes, attributesFactory, valid)


all : Test
all =
  Test.concat
    [ basics ]


basics : Test
basics =
  describe "A set of attributes"
    [ test "should be invalid if any properties is below 100 XP" <|
        \_ ->
          (valid attributesFactory) `equal` False
    , test "should be valid if all properties are at least 100 XP" <|
        \_ ->
          let
            attrs = { attributesFactory
                    | str = 100
                    , bod = 100
                    , rfl = 100
                    , dex = 100
                    , int = 100
                    , wil = 100
                    , cha = 100
                    , edg = 100
                    }
          in
            (valid attrs) `equal` True
    ]
