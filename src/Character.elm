module Character exposing (Character, characterFactory, valid)


import String


type alias Character =
  { xp : Int
  , firstName : String
  , lastName : String
  , concept: String
  }

{-| Creates a character type with default values. -}
characterFactory: Character
characterFactory =
  Character 5000 "" "" ""

{-| Checks the validity of a character type -}
valid: Character -> Bool
valid character =
  (character.xp >= 0 &&
   character.firstName /= "" &&
   character.lastName /= ""
  )
