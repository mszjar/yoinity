import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["audio"];

  playAll() {
    this.audioTargets.forEach(audioElement => {
      if (!audioElement.src) {
        audioElement.src = audioElement.dataset.src;
      }
      audioElement.play();
    });
  }
}
