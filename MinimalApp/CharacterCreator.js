import _ from 'lodash'
import TextFormControl from './TextFormControl.js'
import TextAreaFromControl from './TextAreaFormControl.js'

export default function ({texts, textAreas}) {
  return `<h1>Character Creator</h1>
          <b id="xp">XP: <b id="amount"></b></b>
          <div class="grid">
            <div class="cell -6of12">
              <form id="characterFluff">
                ${_.map(texts, TextFormControl).join('')}
                ${_.map(textAreas, TextAreaFromControl).join('')}
              </form>
            </div>
          </div>
          <hr/>
          <div id="debugging">
            <h3>Debugging:</h3>
            <p>First Name:<p id="debugFName"></p></p>
            <p>Last Name:<p id="debugLName"></p></p>
            <p>Concept:<p id="debugConcept"></p></p>
          </div>`
}
