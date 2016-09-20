module Character exposing (Character,
                           characterFactory,
                           increaseAttribute,
                           valid)


import Attributes exposing (Attributes, attributesFactory, valid)
import String exposing (toUpper)


type alias Character =
  { xp : Int
  , firstName : String
  , lastName : String
  , concept: String
  , attributes: Attributes
  }

{-| Creates a character type with default values. -}
characterFactory: Character
characterFactory =
  Character 5000 "" "" "" attributesFactory

{-| Increase the specified skill of a character by the specified XP -}
increaseAttribute: Character -> String -> Int -> Character
increaseAttribute character name xp =
    let
      attrs = character.attributes
    in
      case (toUpper name) of
        "STR" -> { character
                 | attributes = { attrs | str = attrs.str + xp }
                 , xp = (character.xp - xp)
                 }
        "BOD" -> { character
                 | attributes = { attrs | bod = attrs.bod + xp }
                 , xp = (character.xp - xp)
                 }
        "RFL" -> { character
                 | attributes = { attrs | rfl = attrs.rfl + xp }
                 , xp = (character.xp - xp)
                 }
        "DEX" -> { character
                 | attributes = { attrs | dex = attrs.dex + xp }
                 , xp = (character.xp - xp)
                 }
        "INT" -> { character
                 | attributes = { attrs | int = attrs.int + xp }
                 , xp = (character.xp - xp)
                 }
        "WIL" -> { character
                 | attributes = { attrs | wil = attrs.wil + xp }
                 , xp = (character.xp - xp)
                 }
        "CHA" -> { character
                 | attributes = { attrs | cha = attrs.cha + xp }
                 , xp = (character.xp - xp)
                 }
        "EDG" -> { character
                 | attributes = { attrs | edg = attrs.edg + xp }
                 , xp = (character.xp - xp)
                 }
        _ -> character

{-| Checks the validity of a character type. -}
valid: Character -> Bool
valid character =
  (character.xp >= 0 &&
   character.firstName /= "" &&
   character.lastName /= "" &&
   (Attributes.valid character.attributes)
  )
