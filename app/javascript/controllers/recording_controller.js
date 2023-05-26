import { Controller } from "@hotwired/stimulus"
import RecordRTC from "recordrtc"

export default class extends Controller {
  static targets = ["start", "stop", "form", "language"]

  connect() {
    this.startButton = this.startTarget
    this.stopButton = this.stopTarget
    this.form = this.formTarget
    this.languageInput = this.languageTarget
    this.recorder = null
    this.stopButton.disabled = true
    this.audioBlob = null
    console.log('Controller connected');
  }

  startRecording() {
    console.log('startRecording called');
    navigator.mediaDevices.getUserMedia({ audio: true }).then((stream) => {
      this.recorder = RecordRTC(stream, { type: 'audio' });
      this.recorder.startRecording();
      this.stopButton.disabled = false;
      this.startButton.disabled = true;
    }).catch((error) => {
      console.error('Error accessing audio stream:', error);
    });
  }

  stopRecording() {
    console.log('stopRecording called');
    if (this.recorder) {
      this.stopButton.disabled = true;
      this.recorder.stopRecording(() => {
        this.audioBlob = this.recorder.getBlob();
        this.recorder = null;
        this.startButton.disabled = false;
        console.log('Recording stopped, audioBlob:', this.audioBlob);
      });
    }
  }

  submitForm(event) {
    console.log('submitForm called');
    if (this.audioBlob) {
      let formData = new FormData(this.form);
      formData.append('audio', this.audioBlob);
      formData.set('language', this.languageInput.value);

      fetch(this.form.action, {
          method: 'POST',
          body: formData
      }).then(response => {
          if (response.ok) {
              console.log('Audio uploaded successfully');
              this.startButton.disabled = false;
          } else {
              console.log('Error uploading audio');
          }
      });

      event.preventDefault();
    }
  }
}
