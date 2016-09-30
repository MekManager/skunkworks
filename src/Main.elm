import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App exposing (beginnerProgram)

import Character exposing (Character, attrValue, characterFactory)
import FormControls exposing (..)
import AttributeTable exposing (attributeTable)
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
          , attributeTable model
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
