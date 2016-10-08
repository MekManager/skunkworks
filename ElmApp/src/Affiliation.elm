module Affiliation exposing (Affiliation, languages, valid)


import List exposing (member)
import Attributes exposing (Attributes)
import Skill exposing (Skill)


type alias Affiliation =
  { name : String
  , cost : Int
  , primaryLanguage : String
  , secondaryLanguages : List String
  , attributes : Attributes
  , skills : List Skill
  }


languages : Affiliation -> List String
languages affil =
  if member affil.primaryLanguage affil.secondaryLanguages then
    affil.secondaryLanguages
  else
    affil.primaryLanguage :: affil.secondaryLanguages

valid : Affiliation -> Bool
valid affil =
  (affil.cost /= 0 && affil.primaryLanguage /= "")
