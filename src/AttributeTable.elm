module AttributeTable exposing (attributeTable)


import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Messages exposing (..)

import Character exposing (Character, attrValue)

attributeTable : Character -> (Html Msg)
attributeTable model =
  table []
    [
      thead []
        [ tr []
            [ th [] [ text "Name" ]
            , th [] [ text "Value" ]
            , th [] [ text "XP" ]
            ]
        ]
    , tbody []
      [ tr []
          [ td [] [ text "STR" ]
          , td [] [ text <| toString <| attrValue model "STR" ]
          , td [] [ text <| toString model.attributes.str ]
          ]
      , tr []
          [ td [] [ text "BOD" ]
          , td [] [ text <| toString <| attrValue model "BOD" ]
          , td [] [ text <| toString model.attributes.bod ]
          ]
      , tr []
          [ td [] [ text "RFL" ]
          , td [] [ text <| toString <| attrValue model "RFL" ]
          , td [] [ text <| toString model.attributes.rfl ]
          ]
      , tr []
          [ td [] [ text "DEX" ]
          , td [] [ text <| toString <| attrValue model "DEX" ]
          , td [] [ text <| toString model.attributes.dex ]
          ]
      , tr []
          [ td [] [ text "INT" ]
          , td [] [ text <| toString <| attrValue model "INT" ]
          , td [] [ text <| toString model.attributes.int ]
          ]
      , tr []
          [ td [] [ text "WIL" ]
          , td [] [ text <| toString <| attrValue model "WIL" ]
          , td [] [ text <| toString model.attributes.wil ]
          ]
      , tr []
          [ td [] [ text "CHA" ]
          , td [] [ text <| toString <| attrValue model "CHA" ]
          , td [] [ text <| toString model.attributes.cha ]
          ]
      , tr []
          [ td [] [ text "EDG" ]
          , td [] [ text <| toString <| attrValue model "EDG" ]
          , td [] [ text <| toString model.attributes.edg ]
          ]
      ]
    ]
