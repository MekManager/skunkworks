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
      [ test "should have a value" <|
          \_ ->
            (value skill "standard") `equal` 1
      ]
