import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio"
export default class extends Controller {
  static targets = ["audio"];

  togglePlay() {
    const audio = this.audioTarget;

    // If the src attribute hasn't been set yet, set it
    if (!audio.src) {
      audio.src = audio.dataset.src;
    }

    if (audio.paused) {
      audio.play();
    } else {
      audio.pause();
    }
  }
}
