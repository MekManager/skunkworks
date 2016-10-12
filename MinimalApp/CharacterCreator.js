import _ from 'lodash'
import TextFormControl from './TextFormControl.js'
import TextAreaFromControl from './TextAreaFormControl.js'

const structure = {
  texts: [
    { id: 'firstName', label: 'First Name' },
    { id: 'lastName', label: 'Last Name' }
  ],
  textAreas: [
    { id: 'concept', label: 'Concept' }
  ]
}
export default function () {
  return `<h1>Character Creator</h1>
          <b id="xp">XP: <b id="amount"></b></b>
          <div class="grid">
            <div class="cell -6of12">
              <form id="characterFluff">
                ${_.map(structure.texts, TextFormControl).join('')}
                ${_.map(structure.textAreas, TextAreaFromControl).join('')}
              </form>
            </div>
            <button id="create" class="btn btn-success">Create</button>
          </div>
          <hr/>
          <div id="debugging">
            <h3>Debugging:</h3>
            <p>First Name:<p id="debugFName"></p></p>
            <p>Last Name:<p id="debugLName"></p></p>
            <p>Concept:<p id="debugConcept"></p></p>
            <p>Number of Characters:<p id="debugCharacterNum"></p></p>
          </div>`
}
