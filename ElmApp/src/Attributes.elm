module Attributes exposing ( Attributes
                           , attributesFactory
                           , combine
                           , reduce
                           , valid
                           )


import String exposing (toUpper)


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

{-| Create a new set of attributes by adding two sets together
-}
combine : Attributes -> Attributes -> Attributes
combine x y =
    { x
    | str = x.str + y.str
    , bod = x.bod + y.bod
    , rfl = x.rfl + y.rfl
    , dex = x.dex + y.dex
    , int = x.int + y.int
    , wil = x.wil + y.wil
    , cha = x.cha + y.cha
    , edg = x.edg + y.edg
    }

{-| Create a new set of attributes by removing y's values from x's -}
reduce : Attributes -> Attributes -> Attributes
reduce x y =
  { x
  | str = x.str - y.str
  , bod = x.bod - y.bod
  , rfl = x.rfl - y.rfl
  , dex = x.dex - y.dex
  , int = x.int - y.int
  , wil = x.wil - y.wil
  , cha = x.cha - y.cha
  , edg = x.edg - y.edg
  }

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
