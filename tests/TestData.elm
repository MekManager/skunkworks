module TestData exposing ( basicCharacter
                         , davionAffiliation
                         , validAttrs
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
