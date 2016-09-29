module SkillTest exposing (all)

import Test exposing (..)
import Expect exposing (..)
import Skill exposing (..)


all : Test
all =
  Test.concat
    [ basics, tiered ]

basics : Test
basics =
  let
    skill =
      { name = "Acrobatics"
      , subSkills = [ "Free-Fall", "Gymnastics" ]
      , sub = Nothing
      , targetNumbers = [ 7 ]
      , tiered = False
      , complexities = [ "SB" ]
      , links = [ [ "RFL" ] ]
      , xp = 40
      }
  in
    describe "A Skill"
      [ test "should have an xp of 40" <|
          \_ ->
            skill.xp `equal` 40
      , test "should have a value of 1 with 40XP and standard learning" <|
          \_ ->
            (value skill "standard") `equal` 1
      , test "should have a 0 with 20XP and standard learning" <|
          \_ ->
            (value { skill | xp = 20 } "standard") `equal` 0
      , test "should have a -1 with less than 20XP and standard learning" <|
          \_ ->
            (value { skill | xp = 10 } "standard") `equal` -1
      ]

tiered : Test
tiered =
  let
    skill =
      { name = "Computers"
      , subSkills = []
      , sub = Nothing
      , targetNumbers = [ 8, 9 ]
      , tiered = True
      , complexities = [ "CB", "CA" ]
      , links = [ [ "INT" ], [ "DEX", "INT" ] ]
      , xp = 80
      }
    advancedSkill = { skill | xp = 120 }
  in
    describe "A tiered skill"
      [ test "should have a value of 3 at the basic tier" <|
          \_ ->
            (value skill "standard") `equal` 3
      , test "should have a target number of 8 at the basic tier" <|
          \_ ->
            (targetNumber skill "standard") `equal` 8
      , test "should have a complexity of 'CB' at the basic tier" <|
          \_ ->
            (complexity skill "standard") `equal` "CB"
      , test "should have a link value of ['INT'] at the basic tier" <|
          \_ ->
            (links skill "standard") `equal` [ "INT" ]
      , test "should have a value of 4 at the advanced tier" <|
          \_ ->
            (value advancedSkill "standard") `equal` 4
      , test "should have a target number of 9 at the advanced tier" <|
          \_ ->
            (targetNumber advancedSkill "standard") `equal` 9
      , test "should have a complexity of 'CA' at the advanced tier" <|
          \_ ->
            (complexity advancedSkill "standard") `equal` "CA"
      , test "should have links of [ 'DEX', 'INT' ] at the advanced tier" <|
          \_ ->
            (links advancedSkill "standard") `equal` [ "DEX", "INT" ]
      ]
