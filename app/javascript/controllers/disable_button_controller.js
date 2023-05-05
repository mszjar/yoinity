import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disable-button"
export default class extends Controller {
  static targets = ["button", "link"]

  disable() {
    this.buttonTarget.setAttribute("disabled", "")
    this.linkTarget.classList.remove("d-none")
  }
}
