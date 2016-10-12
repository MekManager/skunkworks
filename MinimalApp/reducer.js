export default function (state = {}, action) {
  switch (action.type) {
  case 'FIRST_NAME':
    return Object.assign({}, state, { firstName: action.value })
  case 'LAST_NAME':
    return Object.assign({}, state, { lastName: action.value })
  case 'CONCEPT':
    return Object.assign({}, state, { concept: action.value })
  default:
    return state
  }
}
