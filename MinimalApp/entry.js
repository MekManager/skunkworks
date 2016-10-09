import $ from 'jquery'
import { createStore } from 'redux'

const renderState = (state) => {
  $('#amount').text(state.xp)
  $('#debugFName').text(state.firstName)
  $('#debugLName').text(state.lastName)
}

const reducer = (state = {}, action) => {
  switch (action.type) {
    case 'FIRST_NAME':
      return Object.assign({}, state, { firstName: action.value })
    case 'LAST_NAME':
      return Object.assign({}, state, { lastName: action.value })
    default:
      return state
  }
}

let store = createStore(reducer)
store.subscribe(() => renderState(store.getState()))

$(document).ready(function () {
  $('#characterFluff').append(require('./textFormControl.hbs')({id: 'firstName', label: 'First Name:'}),
                              require('./textFormControl.hbs')({id: 'lastName', label: 'Last Name:'}),
                              require('./textAreaFormControl.hbs')({id: 'concept', label: 'Concept:'}))
  renderState({ firstName: '', lastName: '', xp: 5000 })

  $('#firstName').on('keyup', () => {
    store.dispatch({ type: 'FIRST_NAME', value: $('#firstName').val() })
  })
  $('#lastName').on('keyup', () => {
    store.dispatch({ type: 'LAST_NAME', value: $('#lastName').val() })
  })
})
