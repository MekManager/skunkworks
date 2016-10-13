import _ from 'lodash'
import CharacterListing from './CharacterListing.js'

export default function ({ characters, uncoolCharacters }) {
  return `<div>
            <h1>Characters</h1>
            <h3>Cool Characters</h3>
            <div id="cool-characters" class="character-list">
              ${_.map(characters, CharacterListing).join('')}
            </div>
            <h3>Not Cool Characters</h3>
            <div id="not-cool-characters" class="character-list">
              ${_.map(uncoolCharacters, CharacterListing).join('')}
            </div>
          </div>`
}
