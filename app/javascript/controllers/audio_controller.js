import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio"
export default class extends Controller {
  static targets = ["audio"];

  togglePlay() {
    const audio = this.audioTarget;
    if (audio.paused) {
      audio.play();
    } else {
      audio.pause();
    }
  }
}
