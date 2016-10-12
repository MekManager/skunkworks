export default function ({firstName, lastName, concept}) {
  return `<div style="margin: 10px; background-color: lightgrey">${firstName} ${lastName}</div>`
  // return `<div style="margin: 10px 0; background-color: lightgrey"><b>Name:</b>${firstName} ${lastName}<br/><b>Concept:</b><br/>${concept}</div>`
}
