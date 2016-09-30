module FormControls exposing (..)

import Character exposing (Character)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Messages exposing (..)


firstNameControl : Character -> List (Html Msg)
firstNameControl model =
  [ label [ for "firstName" ] [ text "First Name:" ]
  , input [ id "firstName"
          , class "form-control"
          , type' "text"
          , onInput FirstName ] [ text model.firstName ]
  ]

lastNameControl : Character -> List (Html Msg)
lastNameControl model =
  [ label [ for "lastName" ] [ text "First Name:" ]
  , input [ id "lastName"
          , class "form-control"
          , type' "text"
          , onInput LastName ] [ text model.lastName ]
  ]

conceptControl : Character -> List (Html Msg)
conceptControl model =
  [ label [ for "concept" ] [ text "Concept:" ]
  , textarea [ id "concept"
              , class "form-control"
              , rows 3
              , onInput Concept ] [ text model.concept ]

  ]
