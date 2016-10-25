module Skill exposing ( Skill
                      , complexity
                      , links
                      , targetNumber
                      , value
                      , (:=)
                      )


import List exposing (head, filter, reverse)
import Maybe exposing (withDefault)
import XpTable exposing (standard, fastLearner, slowLearner)

(~>) = withDefault


type alias Skill =
  { name : String
  , subSkills : List String
  , sub : Maybe String
  , targetNumbers : List Int
  , tiered : Bool
  , complexities : List String
  , links : List (List String)
  , xp : Int
  }

targetNumber : Skill -> String -> Int
targetNumber skill learning =
  let
    skillVal = (value skill learning)
    isTiered = skill.tiered
    vals     = skill.targetNumbers
  in
    0 ~> (tieredValue isTiered skillVal learning vals)

complexity : Skill -> String -> String
complexity skill learning =
  let
    skillVal = (value skill learning)
    isTiered = skill.tiered
    vals     = skill.complexities
  in
    "" ~> (tieredValue isTiered skillVal learning vals)

links : Skill -> String -> List String
links skill learning =
  let
    skillVal = (value skill learning)
    isTiered = skill.tiered
    vals     = skill.links
  in
    [ "" ] ~> (tieredValue isTiered skillVal learning vals)


{-| Finds the value of a particular skill based on an XP table.
-}
value : Skill -> String -> Int
value skill learning =
  case learning of
    "standard"    -> skillValue standard skill.xp
    "fastLearner" -> skillValue fastLearner skill.xp
    "slowLearner" -> skillValue slowLearner skill.xp
    _             -> 0

(:=) : Skill -> Skill -> Bool
(:=) s1 s2 =
  case (s1.sub) of
    Nothing ->
      s1.name == s2.name && s1.sub == Nothing
    _       ->
      s1.name == s2.name && ("" ~> s1.sub) == ("" ~> s2.sub)


-- NOT EXPOSED --

{-| Get the value of a skill based off learning and xp of a skill
  Implementation details:
  Reading this from the inside out, the first action is to reverse the learning
  values. This is done so that the highest value to be greater than or equal to
  the skills xp is first, instead of last. Next we apply the greater than or
  equal to filter on the learning set. `snd` is used because a learning set is
  a tuple of two values like `(index, value)`. This will give a list of of only
  the tuples where the value is gte the xp of the skill. Now take the head of
  that list. Because a list may be empty, head returns a `Maybe`. The index of
  the list is always the skills value, so we use `fst` to get the first part of
  the tuple. However, `fst` does not know how to handle a `Maybe`. Thus a
  default must be provided, if `head` returns `Nothing`, then the default tuple
  will be provided to `fst`.
-}
skillValue : List (Int, Int) -> Int -> Int
skillValue vals xp =
  fst ((-1, -1) ~> (head (filter (\x -> xp >= snd x) (reverse vals))))

tieredValue : Bool -> Int -> String -> List a -> Maybe a
tieredValue isTiered skillVal learning vals =
  if not isTiered then
    head vals
  else
    case (skillVal <= 3) of
      True  -> head vals
      False -> head (reverse vals)
