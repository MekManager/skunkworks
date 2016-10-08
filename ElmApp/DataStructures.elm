module DataStructures exposing (..)

import Attributes exposing (Attributes, attributesFactory)
import Affiliation exposing (Affiliation)
import Character exposing (Character, characterFactory)

davionAffiliation =
  Affiliation
    "Davion"
    150
    "English"
    [ "French", "German", "Hindi", "Russian" ]
    (Attributes 25 0 0 0 0 0 0 0)
    [ protocolFedSunSkill ]

kuritaAffiliation =
  Affiliation
    "Kurita"
    150
    "Japanese"
    [ "Arabic", "English", "Swedenese" ]
    (Attributes 0 0 0 0 0 50 0 0)
    [ artsOralTraditionSkill, protocolDracCombSkill  ]

englishLanguage =
  { name = "Language"
  , subSkills = [ "*" ]
  , sub = Just "English"
  , targetNumbers = [ 5 ]
  , tiered = False
  , complexities = [ "SB" ]
  , links = [ [ "CHA" ] ]
  , xp = 30
  }

perceptionSkill =
  { name = "Perception"
  , subSkills = []
  , sub = Nothing
  , targetNumbers = [ 5 ]
  , tiered = False
  , complexities = [ "SB" ]
  , links = [ [ "CHA" ] ]
  , xp = 20
  }


protocolFedSunSkill =
  { name = "Protocol"
  , subSkills = [ "*" ]
  , sub = Just "FedSuns"
  , targetNumbers = [ 5 ]
  , tiered = False
  , complexities = [ "SB" ]
  , links = [ [ "CHA" ] ]
  , xp = 10
  }

protocolDracCombSkill =
  { name = "Protocol"
  , subSkills = [ "*" ]
  , sub = Just "Draconis Combine"
  , targetNumbers = [ 5 ]
  , tiered = False
  , complexities = [ "SB" ]
  , links = [ [ "CHA" ] ]
  , xp = 15
  }

artsOralTraditionSkill =
  { name = "Arts"
  , subSkills = [ "*" ]
  , sub = Just "Oral Tradition"
  , targetNumbers = [ 5 ]
  , tiered = False
  , complexities = [ "SB" ]
  , links = [ [ "CHA" ] ]
  , xp = 15
  }
