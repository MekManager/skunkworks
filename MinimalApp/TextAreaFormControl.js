export default function({id, label}) {
  return `<fieldset class="form-group form-textarea">
            <label for="${id}">${label}</label>
            <textarea id="${id}" class="form-control" rows="3"></textarea>
          </fieldset>`
}
