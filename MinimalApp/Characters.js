import _ from 'lodash'
import CharacterListing from './CharacterListing.js'

export default function ({ characters }) {
  return `<div>
            <h1>Characters</h1>
            <h3>Cool Characters</h3>
            <div id="cool-characters">
              ${_.map(characters, CharacterListing).join('')}
            </div>
            <h3>Not Cool Characters</h3>
            <div id="not-cool-characters">
              <div>5th Hour Kid</div>
            </div>
          </div>`
}
