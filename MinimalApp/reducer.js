import { v4 } from 'node-uuid'
import _ from 'lodash'

const defaultState = {
  firstName: '',
  lastName: '',
  xp: 5000,
  path: '/',
  characters: [],
  uncoolCharacters: [
    { id: v4(), firstName: 'John', lastName: 'Doe' },
    { id: v4(), firstName: 'John', lastName: 'Q. Public' }
  ]
}
export default function (state = defaultState, action) {
  switch (action.type) {
  case 'FIRST_NAME':
    return Object.assign({}, state, { firstName: action.value })
  case 'LAST_NAME':
    return Object.assign({}, state, { lastName: action.value })
  case 'CONCEPT':
    return Object.assign({}, state, { concept: action.value })
  case 'CREATE_CHARACTER':
    const newCharacter = { id: v4(), firstName: state.firstName, lastName: state.lastName, concept: state.concept }
    return Object.assign({},
                         state,
                         {
                           characters: [...state.characters, newCharacter],
                           firstName: '',
                           lastName: '',
                           concept: ''
                         })
  case 'ROUTE':
    return Object.assign({}, state, { path: action.value })
  case 'MOVE_CHARACTER':
    const character  = _.find(state.characters, (c) => c.id === action.character)
    console.log(character)
    if (character === undefined) {
      console.log('is uncool character')
      const uncoolChar = _.find(state.uncoolCharacters, (c) => c.id === action.character)
      if (action.to === 'not-cool-characters') return state // do nothing, already there
      else return Object.assign({},
                                state,
                                { characters: [...state.characters, uncoolChar],
                                  uncoolCharacters: _.reject(state.uncoolCharacters, (c) => c.id === action.character)
                                })
    } else {
      console.log('is cool character')
      if (action.to === 'cool-characters') return state // do nothing, already there
      else return Object.assign({},
                                state,
                                { uncoolCharacters: [...state.uncoolCharacters, character],
                                  characters: _.reject(state.characters, (c) => c.id === action.character)
                                })
    }
  default:
    return state
  }
}
