import $ from 'jquery'
import { createStore } from 'redux'
import CharacterCreator from './CharacterCreator.js'
import reducer from './reducer.js'
import renderState from './render.js'

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
  renderState({ firstName: '', lastName: '', xp: 5000 })

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
