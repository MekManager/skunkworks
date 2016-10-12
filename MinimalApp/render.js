import $ from 'jquery'

export default function (state) {
  $('#amount').text(state.xp)
  $('#debugFName').text(state.firstName)
  $('#debugLName').text(state.lastName)
  $('#debugConcept').text(state.concept)
  $('#debugCharacterNum').text(state.characters.length)
}
