module SkillTest exposing (all)

import Test exposing (..)
import Expect exposing (..)
import Skill exposing (Skill, value)


all : Test
all =
  Test.concat
    [ basics ]

basics : Test
basics =
  let
    skill =
      { name = "Acrobatics"
      , subSkills = [ "Free-Fall", "Gymnastics" ]
      , sub = Nothing
      , targetNumbers = [ 7 ]
      , complexities = [ "SB" ]
      , links = [ [ "RFL" ] ]
      , xp = 40
      }
  in
    describe "A Skill"
      [ test "should have a value of 1 with 40XP and standard learning" <|
          \_ ->
            (value skill "standard") `equal` 1
      , test "should have a 0 with 20XP and standard learning" <|
          \_ ->
            (value { skill | xp = 20 } "standard") `equal` 0
      , test "should have a -1 with less than 20XP and standard learning" <|
          \_ ->
            (value { skill | xp = 10 } "standard") `equal` -1
      ]
