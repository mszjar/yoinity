import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["audio", "playIcon", "pauseIcon"];

  connect() {
    this.hideIcons(); // Ensure icons are hidden initially
  }

  showControls() {
    const audio = this.audioTarget;
    if (audio.paused) {
      this.playIconTarget.style.display = 'block';
    } else {
      this.pauseIconTarget.style.display = 'block';
    }
  }

  hideIcons() {
    this.playIconTarget.style.display = 'none';
    if (this.audioTarget.paused) {
      this.pauseIconTarget.style.display = 'none';
    }
  }

  togglePlay() {
    const audio = this.audioTarget;

    if (!audio.src) {
      audio.src = audio.dataset.src;
    }

    if (audio.paused) {
      audio.play();
      this.playIconTarget.style.display = 'none';
      this.pauseIconTarget.style.display = 'block';
    } else {
      audio.pause();
      this.playIconTarget.style.display = 'block';
      this.pauseIconTarget.style.display = 'none';
    }
  }
}
