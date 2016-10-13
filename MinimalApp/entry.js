import $ from 'jquery'
import _ from 'lodash'
import page from 'page'
import { createStore } from 'redux'
import CharacterCreator from './CharacterCreator.js'
import Characters from './Characters.js'
import reducer from './reducer.js'
import render from './render.js'
import events from './events.js'

let store = createStore(reducer)
store.subscribe(() => render(store))

$(document).ready(function () {
  // ============ Routes ================
  page.base('/')
  page('/', () => {
    $('#app').html(CharacterCreator())
    store.dispatch({ type: 'ROUTE', value: '/' })
    render(store)
  })
  page('characters', () => {
    $('#app').html(Characters(store.getState()))
    store.dispatch({ type: 'ROUTE', value: '/characters' })
    render(store)
  })
  page('*', () => { $('#app').html('<h1>404: Not found</h1>') })
  page()

  // ============ Init ================
  $('#app').html(CharacterCreator())
  render(store)

  // ============ Events ================
  _.each(events(store), (e) => $(document).on(e.event, e.on, e.func))
})
