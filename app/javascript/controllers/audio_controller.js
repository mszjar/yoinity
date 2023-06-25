import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["audio", "playIcon", "pauseIcon", "greenOverlay", "nickname", "progressBar", "duration", "progressContainer", "currentTime"];

  connect() {
    this.hideIcons(); // Ensure icons are hidden initially

    this.audio = this.audioTarget;
    this.progressBar = this.progressBarTarget;
    this.durationLabel = this.durationTarget;
    this.progressContainer = this.progressContainerTarget;
    this.currentTimeLabel = this.currentTimeTarget;

    this.audio.addEventListener('timeupdate', this.updateProgressBar.bind(this));
    this.audio.addEventListener('timeupdate', this.updateCurrentTime.bind(this));
    this.audio.addEventListener('loadedmetadata', this.updateDuration.bind(this));
    this.progressContainer.addEventListener('click', this.seek.bind(this));
  }

  disconnect() {
    this.audio.removeEventListener('timeupdate', this.updateProgressBar.bind(this));
    this.audio.removeEventListener('timeupdate', this.updateCurrentTime.bind(this));
    this.audio.removeEventListener('loadedmetadata', this.updateDuration.bind(this));
    this.progressContainer.removeEventListener('click', this.seek.bind(this));
  }

  updateProgressBar() {
    const percentage = (this.audio.currentTime / this.audio.duration) * 100;
    this.progressBar.style.width = `${percentage}%`;
  }

  updateCurrentTime() {
    const minutes = Math.floor(this.audio.currentTime / 60);
    const seconds = Math.floor(this.audio.currentTime - minutes * 60);
    this.currentTimeLabel.textContent = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
  }

  updateDuration() {
    const minutes = Math.floor(this.audio.duration / 60);
    const seconds = Math.floor(this.audio.duration - minutes * 60);
    this.durationLabel.textContent = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
  }

  seek(event) {
    const percent = event.offsetX / this.progressContainer.offsetWidth;
    this.audio.currentTime = percent * this.audio.duration;
  }

  showControls() {
    const audio = this.audioTarget;
    if (audio.paused) {
      this.playIconTarget.style.display = 'block';
      this.greenOverlayTarget.style.display = 'block';
    } else {
      this.pauseIconTarget.style.display = 'block';
    }
  }

  hideIcons() {
    this.playIconTarget.style.display = 'none';
    this.greenOverlayTarget.style.display = 'none';
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
      this.greenOverlayTarget.style.display = 'none';
      this.pauseIconTarget.style.display = 'block';
      this.nicknameTarget.style.color = '#1FDF64'; // Change the nickname to green
    } else {
      audio.pause();
      this.playIconTarget.style.display = 'block';
      this.greenOverlayTarget.style.display = 'block';
      this.pauseIconTarget.style.display = 'none';
      this.nicknameTarget.style.color = '#AEAEB3'; // Revert the nickname color to initial
    }
  }
}
