import _ from 'lodash'
import CharacterListing from './CharacterListing.js'

export default function ({ characters }) {
  return `<div>
          <h1>Characters:</h1>
          <ul>
            ${_.map(characters, CharacterListing).join('')}
          <ul>
          </div>`
}
