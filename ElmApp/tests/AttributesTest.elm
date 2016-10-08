module AttributesTest exposing (all)


import Test exposing (..)
import TestData exposing (..)
import Expect exposing (..)
import Attributes exposing (Attributes, attributesFactory, combine, valid)


all : Test
all =
  Test.concat
    [ basics ]


basics : Test
basics =
  describe "A set of attributes"
    [ test "should be invalid if any properties is below 100 XP" <|
        \_ ->
          (valid attributesFactory) `equal` False
    , test "should be valid if all properties are at least 100 XP" <|
        \_ ->
          let
            attrs = validAttrs
          in
            (valid attrs) `equal` True
    , test "should be able to combine two sets of attributes" <|
        \_ ->
          let
            a1 = validAttrs
            a2 = Attributes 25 25 25 25 25 25 25 25
          in
            (a1 `combine` a2) `equal` (Attributes 125 125 125 125 125 125 125 125)
    ]
