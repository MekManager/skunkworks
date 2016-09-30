import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App exposing (beginnerProgram)

import Character exposing (Character, attrValue, characterFactory, increaseAttribute, decreaseAttribute)
import FormControls exposing (..)
import AttributeTable exposing (attributeTable)
import Messages exposing (..)


main =
  beginnerProgram { model = characterFactory, view = view, update = update }

view model =
  div []
    [ h1 [] [ text "Character Creator" ]
    , b [] [ text <| "XP: " ++ (toString model.xp) ]
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
          , attributeTable model True
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
      AddStr         -> increaseAttribute model "STR" 10
      DecStr         -> decreaseAttribute model "STR" 10
      AddBod         -> increaseAttribute model "BOD" 10
      DecBod         -> decreaseAttribute model "BOD" 10
      AddRfl         -> increaseAttribute model "RFL" 10
      DecRfl         -> decreaseAttribute model "RFL" 10
      AddDex         -> increaseAttribute model "DEX" 10
      DecDex         -> decreaseAttribute model "DEX" 10
      AddInt         -> increaseAttribute model "INT" 10
      DecInt         -> decreaseAttribute model "INT" 10
      AddWil         -> increaseAttribute model "WIL" 10
      DecWil         -> decreaseAttribute model "WIL" 10
      AddCha         -> increaseAttribute model "CHA" 10
      DecCha         -> decreaseAttribute model "CHA" 10
      AddEdg         -> increaseAttribute model "EDG" 10
      DecEdg         -> decreaseAttribute model "EDG" 10
      Reset          -> characterFactory
