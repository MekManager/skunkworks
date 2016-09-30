import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App exposing (beginnerProgram)

import Character exposing (Character, attrValue, characterFactory)
import FormControls exposing (..)
import Messages exposing (..)


main =
  beginnerProgram { model = characterFactory, view = view, update = update }

view model =
  div []
    [ h1 [] [ text "Character Creator" ]
    , hr [] []
    , div [ class "grid" ]
        [ div [ class "cell -6of12" ]
          [ Html.form []
              [ fieldset [ class "form-group" ]
                  <| firstNameControl model
              , fieldset [ class "form-group" ]
                  <| lastNameControl model
              , fieldset [ class "form-group form-textarea" ]
                  <| conceptControl model
              ]
          , table []
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
          ]
        , div [ class "cell -6of12" ]
          [
            text "wow"
          ]
        ]
    , div []
      [ hr [] []
      , h3 [] [ text "Debugging:" ]
      , p [] [ text <| "first name: " ++ model.firstName ]
      , p [] [ text <| "last name: " ++ model.lastName ]
      , p [] [ text <| "concept: " ++ model.concept ]
      , button [ class "btn btn-primary", onClick AddStr ] [ text "Add Strength" ]
      , button [ class "btn btn-warning", onClick Reset ] [ text "Reset Character" ]
      ]
    ]


update msg model =
  let
    attrs = model.attributes
  in
    case msg of
      FirstName name -> { model | firstName = name }
      LastName name  -> { model | lastName  = name }
      Concept text   -> { model | concept = text }
      AddStr         -> { model | attributes = { attrs | str = attrs.str + 10 } }
      Reset          -> characterFactory
