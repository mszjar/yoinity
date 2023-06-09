import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "display" ]

  toggle() {
    this.displayTargets.forEach((element) => {
      element.classList.toggle('d-none');
    });
  }
}
