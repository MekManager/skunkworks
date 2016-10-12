import $ from 'jquery'
import dragula from 'dragula'

export default function (state) {
  switch(state.path) {
  case '/':
    $('#amount').text(state.xp)
    $('#debugFName').text(state.firstName)
    $('#debugLName').text(state.lastName)
    $('#debugConcept').text(state.concept)
    $('#debugCharacterNum').text(state.characters.length)
  break;
  case '/characters':
    dragula([document.getElementById('cool-characters'), document.getElementById('not-cool-characters')])
  break;
  default:
    return null
  }
}
