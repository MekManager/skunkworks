module XpTableTests exposing (all)


import Test exposing (..)
import Expect exposing (..)
import XpTable exposing (..)


all : Test
all =
  Test.concat
    [ basic ]


basic : Test
basic =
  describe "XP Tables"
    [ test "The standard XP Table" <|
        \_ ->
          equal
            XpTable.standard
            [ (0, 20)
            , (1, 30)
            , (2, 50)
            , (3, 80)
            , (4, 120)
            , (5, 170)
            , (6, 230)
            , (7, 300)
            , (8, 380)
            , (9, 470)
            , (10, 570)
            ]
    , test "The fast learner XP Table" <|
        \_ ->
          equal
            XpTable.fastLearner
            [ (0, 18)
            , (1, 27)
            , (2, 45)
            , (3, 72)
            , (4, 108)
            , (5, 153)
            , (6, 207)
            , (7, 270)
            , (8, 342)
            , (9, 423)
            , (10, 513)
            ]
    , test "The slow learner XP Table" <|
        \_ ->
          equal
            XpTable.slowLearner
            [ (0, 22)
            , (1, 33)
            , (2, 55)
            , (3, 88)
            , (4, 132)
            , (5, 187)
            , (6, 253)
            , (7, 330)
            , (8, 418)
            , (9, 517)
            , (10, 627)
            ]
    ]
