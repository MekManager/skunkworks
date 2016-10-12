const defaultState = {
  firstName: '',
  lastName: '',
  xp: 5000,
  path: '/',
  characters: []
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
    const newCharacter = { firstName: state.firstName, lastName: state.lastName, concept: state.concept }
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
  default:
    return state
  }
}
