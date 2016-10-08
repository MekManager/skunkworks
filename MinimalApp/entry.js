import $ from 'jquery'


$(document).ready(function () {
  const name = 'Eric'
  $('#inject').text(`hi there! ${name}`)
  $('#pow').text(`2 to the power of 2 is ${2 ** 2}`)
})
