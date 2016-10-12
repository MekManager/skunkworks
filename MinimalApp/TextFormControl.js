export default function ({id, label}) {
  return `<fieldset class="form-group">
            <label for="${id}">${label}</label>
            <input id="${id}" class="form-control" type="text">
          </fieldset>`
}
