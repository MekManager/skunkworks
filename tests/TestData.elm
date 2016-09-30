module TestData exposing ( basicCharacter
                         , davionAffiliation
                         , validAttrs
                         , acrobaticsSkill
                         , computersSkill
                         )


import Attributes exposing (Attributes, attributesFactory)
import Affiliation exposing (Affiliation)
import Character exposing (Character, characterFactory)


basicCharacter =
  { characterFactory
  | firstName = "John"
  , lastName  = "Doe"
  , concept   = ""
  , attributes = validAttrs
  }

davionAffiliation =
  Affiliation
    "Davion"
    150
    "English"
    [ "French", "German", "Hindi", "Russian" ]
    (Attributes 25 0 0 0 0 0 0 0)

validAttrs =
  { attributesFactory
  | str = 100
  , bod = 100
  , rfl = 100
  , dex = 100
  , int = 100
  , wil = 100
  , cha = 100
  , edg = 100
  }

acrobaticsSkill =
  { name = "Acrobatics"
  , subSkills = [ "Free-Fall", "Gymnastics" ]
  , sub = Nothing
  , targetNumbers = [ 7 ]
  , tiered = False
  , complexities = [ "SB" ]
  , links = [ [ "RFL" ] ]
  , xp = 40
  }

computersSkill =
  { name = "Computers"
  , subSkills = []
  , sub = Nothing
  , targetNumbers = [ 8, 9 ]
  , tiered = True
  , complexities = [ "CB", "CA" ]
  , links = [ [ "INT" ], [ "DEX", "INT" ] ]
  , xp = 80
  }
