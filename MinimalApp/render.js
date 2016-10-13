import $ from 'jquery'
import dragula from 'dragula'

/* This will ensure that:
 *   - The element to contain draggables exists.
 *   - The element has not already been setup to drag.
 */
const readyToDrag = (id) => $(`#${id}`).length && !$(`#${id}.dragged`).length

export default function (store) {
  let state = store.getState()
  switch (state.path) {
    case '/':
      $('#amount').text(state.xp)
      $('#debugFName').text(state.firstName)
      $('#debugLName').text(state.lastName)
      $('#debugConcept').text(state.concept)
      $('#debugCharacterNum').text(state.characters.length)
      if (readyToDrag('listing-one') && readyToDrag('listing-two')) {
        $('#listing-one').addClass('dragged')
        $('#listing-two').addClass('dragged')
        dragula([document.getElementById('listing-one'), document.getElementById('listing-two')])
      }
      break
    case '/characters':
      if (readyToDrag('cool-characters') && readyToDrag('not-cool-characters')) {
        $('#cool-characters').addClass('dragged')
        $('#not-cool-characters').addClass('dragged')
        dragula([document.getElementById('cool-characters'), document.getElementById('not-cool-characters')])
          .on('drop', (el, target) => {
            store.dispatch({ type: 'MOVE_CHARACTER', character: $(el).attr('id'), to: $(target).attr('id') })
          })
      }
      break
    default:
      return null
  }
}
