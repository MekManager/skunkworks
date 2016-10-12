import $ from 'jquery'
import { createStore } from 'redux'
import CharacterCreator from './CharacterCreator.js'

const renderState = (state) => {
  $('#amount').text(state.xp)
  $('#debugFName').text(state.firstName)
  $('#debugLName').text(state.lastName)
  $('#debugConcept').text(state.concept)
}

const reducer = (state = {}, action) => {
  switch (action.type) {
    case 'FIRST_NAME':
      return Object.assign({}, state, { firstName: action.value })
    case 'LAST_NAME':
      return Object.assign({}, state, { lastName: action.value })
    case 'CONCEPT':
      return Object.assign({}, state, { concept: action.value})
    default:
      return state
  }
}

let store = createStore(reducer)
store.subscribe(() => renderState(store.getState()))

$(document).ready(function () {
  $('#app').html(CharacterCreator({
    texts: [
      { id: 'firstName', label: 'First Name' },
      { id: 'lastName', label: 'Last Name' }
    ],
    textAreas: [
      { id: 'concept', label: 'Concept' }
    ]
  }))
  // renderState({ firstName: '', lastName: '', xp: 5000 })

  $('#firstName').on('keyup', () => {
    store.dispatch({ type: 'FIRST_NAME', value: $('#firstName').val() })
  })
  $('#lastName').on('keyup', () => {
    store.dispatch({ type: 'LAST_NAME', value: $('#lastName').val() })
  })
  $('#concept').on('keyup', () => {
    store.dispatch({ type: 'CONCEPT', value: $('#concept').val() })
  })
})
