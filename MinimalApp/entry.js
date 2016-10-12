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
store.subscribe(() => render(store.getState()))

$(document).ready(function () {
  // ============ Routes ================
  page('/', () => { $('#app').html(CharacterCreator()); render(store.getState()) })
  page('/characters', () => { $('#app').html(Characters(store.getState())); render(store.getState()) })
  page()

  // ============ Init ================
  $('#app').html(CharacterCreator())
  render({ firstName: '', lastName: '', xp: 5000, characters: [] })

  // ============ Events ================
  _.each(events(store), (e) => $(document).on(e.event, e.on, e.func))
})
