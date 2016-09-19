module Attributes exposing (Attributes,
                            attributesFactory,
                            valid)


type alias Attributes =
  { str : Int
  , bod : Int
  , rfl : Int
  , dex : Int
  , int : Int
  , wil : Int
  , cha : Int
  , edg : Int
  }

{-| Creates a attributes type with default values. -}
attributesFactory : Attributes
attributesFactory =
  Attributes 0 0 0 0 0 0 0 0

{-| Checks the validity of a set of attributes. -}
valid : Attributes -> Bool
valid attributes =
  (attributes.str >= 100 &&
   attributes.bod >= 100 &&
   attributes.rfl >= 100 &&
   attributes.dex >= 100 &&
   attributes.int >= 100 &&
   attributes.wil >= 100 &&
   attributes.cha >= 100 &&
   attributes.edg >= 100
  )
