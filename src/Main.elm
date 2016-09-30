import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App exposing (beginnerProgram)

import Character exposing (Character, characterFactory)
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
          ]
        , div [ class "cell -6of12" ]
          [
            text "wow"
          ]
        ]
    , div []
      [ hr [] []
      , p [] [ text <| "first name: " ++ model.firstName ]
      , p [] [ text <| "last name: " ++ model.lastName ]
      , p [] [ text <| "concept: " ++ model.concept ]
      ]
    ]
    -- , button [ class "btn btn-default", onClick Decrement ] [ text "cool" ]
    -- , div [] [ text model.firstName ]
    -- , button [ class "btn btn-default", onClick Increment ] [ text "woah" ]


update msg model =
  case msg of
    FirstName name -> { model | firstName = name }
    LastName name  -> { model | lastName  = name }
    Concept text   -> { model | concept = text }
