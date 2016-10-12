import $ from 'jquery'

export default function (store) {
  return [
    {
      event: 'keyup',
      on: '#firstName',
      func: () => { store.dispatch({ type: 'FIRST_NAME', value: $('#firstName').val() }) }
    },
    {
      event: 'keyup',
      on: '#lastName',
      func: () => { store.dispatch({ type: 'LAST_NAME', value: $('#lastName').val() }) }
    },
    {
      event: 'keyup',
      on: '#concept',
      func: () => { store.dispatch({ type: 'CONCEPT', value: $('#concept').val() }) }
    },
    {
      event: 'click',
      on: '#create',
      func: () => {
        $('#firstName').val('')
        $('#lastName').val('')
        $('#concept').val('')
        store.dispatch({ type: 'CREATE_CHARACTER'})
      }
    }
]
}
