module CharacterTest exposing (all)


import Test exposing (..)
import Expect exposing (..)
import Character exposing (Character, characterFactory, valid, increaseAttribute)
import Attributes exposing (attributesFactory)


all : Test
all =
  Test.concat
    [ basics ]

basics : Test
basics =
  describe "A Character"
    [ test "starts with 5000 XP" <|
        \_ ->
          let
            char = characterFactory
          in
            char.xp `equal` 5000
    , test "can have a different xp specified" <|
        \_ ->
          let
            char = { characterFactory | xp = 3000 }
          in
            char.xp `equal` 3000
    , test "can have a first and last name set" <|
        \_ ->
          let
            char = { characterFactory | firstName = "John", lastName = "Doe" }
          in
            (char.firstName ++ " " ++ char.lastName) `equal` "John Doe"
    , test "should not be valid without a first and last name" <|
        \_ ->
          (valid characterFactory) `equal` False
    , test "should not be valid with negative xp" <|
        \_ ->
          let
            char = { characterFactory | xp = -10 }
          in
            (valid char) `equal` False
    , test "a concept should not be required to be valid" <|
        \_ ->
          let
            char = { characterFactory
                   | firstName  = "John"
                   , lastName   = "Doe"
                   , concept    = ""
                   , attributes = { attributesFactory
                                  | str = 100
                                  , bod = 100
                                  , rfl = 100
                                  , dex = 100
                                  , int = 100
                                  , wil = 100
                                  , cha = 100
                                  , edg = 100
                                  }
                   }
          in
            (valid char) `equal` True
    , test "should have xp equal to the amount given assigned to the specified attribute" <|
        \_ ->
          let
            char = increaseAttribute characterFactory "str" 120
          in
            (char.attributes.str == 120 && char.xp == 4880) `equal` True
    ]
