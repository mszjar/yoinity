import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["audio", "nickname", "playIcon", "pauseIcon", "greenOverlay", "playAllIcon", "pauseAllIcon", "greenAllOverlay"];

  connect() {
    this.playAll();
    if (!this.audioTargets.some(audio => !audio.paused)) {
      this.playAllIconTarget.style.display = 'block';
      this.greenAllOverlayTarget.style.display = 'block';
    }
  }

  playAll() {
    this.audioTargets.forEach(audioElement => {
      if (!audioElement.src) {
        audioElement.src = audioElement.dataset.src;
      }

      audioElement.play();
      this.nicknameTargets.forEach(nickname => nickname.style.color = '#1FDF64');
    });

    this.playAllIconTarget.style.display = 'none';
    this.greenAllOverlayTarget.style.display = 'none';
    this.pauseAllIconTarget.style.display = 'block';
  }

  pauseAll() {
    this.audioTargets.forEach(audioElement => audioElement.pause());
    this.nicknameTargets.forEach(nickname => nickname.style.color = '#AEAEB3');
    this.playAllIconTarget.style.display = 'block';
    this.greenAllOverlayTarget.style.display = 'block';
    this.pauseAllIconTarget.style.display = 'none';
  }

  togglePlayAll() {
    if (this.audioTargets.some(audio => !audio.paused)) {
      this.pauseAll();
    } else {
      this.playAll();
    }
  }
}
