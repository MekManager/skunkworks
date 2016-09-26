module CharacterTest exposing (all)


import Test exposing (..)
import Expect exposing (..)
import Character exposing ( Character
                          , affiliate
                          , attrValue
                          , characterFactory
                          , valid
                          , increaseAttribute
                          )
import Affiliation exposing (Affiliation)
import Attributes exposing (Attributes, attributesFactory)


all : Test
all =
  Test.concat
    [ basics, validity, affiliation ]

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
    , test "should have xp equal to the amount given assigned to the specified attribute" <|
        \_ ->
          let
            char = increaseAttribute characterFactory "str" 120
          in
            (char.attributes.str == 120 && char.xp == 4880) `equal` True
    , test "should return the given character when an invaid attribute is specified" <|
        \_ ->
          let
            char = increaseAttribute characterFactory "wat" 120
          in
            char.xp `equal` 5000
    , test "100XP should have a value of 1 for an attribute" <|
        \_ ->
          let
            char = increaseAttribute characterFactory "str" 100
          in
            attrValue char "str" `equal` 1
    , test "399XP should have a value of 3 for an attribute" <|
        \_ ->
          let
            char = increaseAttribute characterFactory "str" 399
          in
            attrValue char "str" `equal` 3
    ]


affiliation : Test
affiliation =
  let
    affiliation =
        Affiliation
          "Davion"
          150
          "English"
          ["French", "German", "Hindi", "Russian"]
          (Attributes 25 0 0 0 0 0 0 0)
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
    affiliated = affiliate char affiliation
  in
    describe "A character's affiliations"
      [ test "An affiliation should have a cost to the character" <|
          \_ ->
            affiliated.xp `equal`  4850
      ]

validity : Test
validity =
  describe "A Character's validity"
      [ test "should not be valid without a first and last name" <|
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
      ]
