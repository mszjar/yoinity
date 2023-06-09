import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preview-image"
export default class extends Controller {
  static targets = [ "input", "preview" ]

  preview() {
    let input = this.inputTarget
    let preview = this.previewTarget
    if (input.files && input.files[0]) {
      var reader = new FileReader()
      reader.onload = (e) => {
        preview.src = e.target.result
        preview.style.display = 'block'
      }
      reader.readAsDataURL(input.files[0])
    }
  }
}
