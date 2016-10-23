import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App exposing (beginnerProgram)
import Maybe exposing (withDefault)

import Character exposing (Character, attrValue, characterFactory, increaseAttribute, decreaseAttribute, affiliate)
import Skill exposing (Skill)
import FormControls exposing (..)
import DataStructures exposing (..)
import AttributeTable exposing (attributeTable)
import Messages exposing (..)


main =
  let
    char = { characterFactory | skills = [ perceptionSkill, englishLanguage ] }
  in
  beginnerProgram { model = char, view = view, update = update }

skillElem : Skill -> (Html Msg)
skillElem skill =
  let
    name = case skill.sub of
            Nothing -> skill.name
            _       -> skill.name ++ "/" ++ (withDefault "" skill.sub)
  in
  li [] [ text  name ]

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
          [ b [] [ text "Skills:" ]
          , hr [] []
          , ul [ id "skills" ] (List.map skillElem model.skills)
          , b [] [ text "Affiliations:" ]
          , hr [] []
          , ul [] <| List.map (\a -> li [] [ text a.name ]) model.affiliations
          ]
        ]
    , div []
      [ hr [] []
      , h3 [] [ text "Debugging:" ]
      , p [] [ text <| "first name: " ++ model.firstName ]
      , p [] [ text <| "last name: " ++ model.lastName ]
      , p [] [ text <| "concept: " ++ model.concept ]
      , p [] [ text <| "skills len:" ++ (toString <| List.length model.skills) ]
      , button [ class "btn btn-warning", onClick Reset ] [ text "Reset Character" ]
      , button [ class "btn btn-info", onClick AddDavion ] [ text "Affiliate with House Davion" ]
      , button [ class "btn btn-info", onClick AddKurita ] [ text "Affiliate with House Kurita" ]
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
      AddDavion      -> model `affiliate` davionAffiliation
      AddKurita      -> model `affiliate` kuritaAffiliation
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
      Reset          -> { characterFactory | skills = [ perceptionSkill, englishLanguage ] }
