import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["audio", "playIcon", "pauseIcon"];

  showControls() {
    this.playIconTarget.style.display = 'block';
  }

  hideControls() {
    this.playIconTarget.style.display = 'none';
    this.pauseIconTarget.style.display = 'none';
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
