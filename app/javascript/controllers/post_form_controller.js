import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post-form"
export default class extends Controller {
  connect() {
    this.element.querySelector("#post_title").focus()
  }
}
