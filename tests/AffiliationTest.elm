module AffiliationTest exposing (all)


import Test exposing (..)
import Expect exposing (..)
import Attributes exposing (Attributes)
import Affiliation exposing (Affiliation, languages, valid)


all : Test
all =
  Test.concat
    [ basics ]

basics : Test
basics =
  let
    affiliation =
      Affiliation
        "Davion"
        150
        "English"
        ["French", "German", "Hindi", "Russian"]
        (Attributes 25 0 0 0 0 0 0 0)
    otherAffil = { affiliation | primaryLanguage = "French" }
    invalidAffil = { affiliation | cost = 0 }
    invalidAffil2 = { affiliation | primaryLanguage = "" }
  in
    describe "An Affiliation"
      [ test "It should return a list of all it's languages" <|
          \_ ->
            (languages affiliation)
            `equal`
            [ "English", "French", "German", "Hindi", "Russian" ]
      , test "It should filter out the primary language if it's in the secondaries" <|
          \_ ->
            (languages otherAffil)
            `equal`
            [ "French", "German", "Hindi", "Russian" ]
      , test "should be valid" <|
          \_ ->
            (valid affiliation) `equal` True
      , test "should be valid without secondary languages" <|
          \_ ->
            let
              af = { affiliation | secondaryLanguages = [] }
            in
              (valid af) `equal` True
      , test "should be invalid" <|
          \_ ->
            (valid invalidAffil) `equal` False
      , test "should also be invalid" <|
          \_ ->
            (valid invalidAffil2) `equal` False
      ]
