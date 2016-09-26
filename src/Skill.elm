module Skill exposing (..)


import List exposing (head, filter, reverse)
import Maybe exposing (withDefault)
import XpTable exposing (standard, fastLearner, slowLearner)


--, tiered : List List String
type alias Skill =
  { name : String
  , subSkills : List String
  , sub : Maybe String
  , targetNumbers : List Int
  , complexities : List String
  , links : List (List String)
  , xp : Int
  }


{-| Finds the value of a particular skill based on an XP table.
-}
-- "standard"    -> head (filter (\x -> skill.xp >= x) (reverse standard))
value : Skill -> String -> Int
value skill learning =
  case learning of
    "standard"    -> getSkillIndex standard skill.xp
    "fastLearner" -> getSkillIndex fastLearner skill.xp
    "slowLearner" -> getSkillIndex slowLearner skill.xp
    _             -> 0

getSkillIndex : List (Int, Int) -> Int -> Int
getSkillIndex vals xp =
  fst (withDefault (0, 0) (head (filter (\x -> xp >= snd x) (reverse vals))))
