import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App exposing (beginnerProgram)

import Character exposing (Character, characterFactory)


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
                  [ label [ for "firstName" ] [ text "First Name:" ]
                  , input [ id "firstName"
                          , class "form-control"
                          , type' "text"
                          , onInput FirstName ] [ text model.firstName ]
                  ]
              , fieldset [ class "form-group" ]
                  [ label [ for "lastName" ] [ text "First Name:" ]
                  , input [ id "lastName"
                          , class "form-control"
                          , type' "text"
                          , onInput LastName ] [ text model.lastName ]
                  ]
              , fieldset [ class "form-group form-textarea" ]
                  [ label [ for "concept" ] [ text "Concept:" ]
                  , textarea [ id "concept"
                             , class "form-control"
                             , rows 3
                             , onInput Concept ] [ text model.concept ]

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
      , p [] [ text <| "first name: " ++ model.firstName ]
      , p [] [ text <| "last name: " ++ model.lastName ]
      , p [] [ text <| "concept: " ++ model.concept ]
      ]
    ]
    -- , button [ class "btn btn-default", onClick Decrement ] [ text "cool" ]
    -- , div [] [ text model.firstName ]
    -- , button [ class "btn btn-default", onClick Increment ] [ text "woah" ]

type Msg
  = FirstName String
  | LastName String
  | Concept String

update msg model =
  case msg of
    FirstName name -> { model | firstName = name }
    LastName name  -> { model | lastName  = name }
    Concept text   -> { model | concept = text }
