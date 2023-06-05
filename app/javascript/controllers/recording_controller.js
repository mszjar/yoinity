import { Controller } from "@hotwired/stimulus"
import RecordRTC from "recordrtc"

export default class extends Controller {
  static targets = ["start", "stop", "form", "language", "messages"]

  connect() {
    this.startButton = this.startTarget
    this.stopButton = this.stopTarget
    this.form = this.formTarget
    this.languageInput = this.languageTarget
    this.messages = this.messagesTarget
    this.recorder = null
    this.stopButton.disabled = true
    this.audioBlob = null
  }

  startRecording() {
    console.log('startRecording called');
    this.messages.innerHTML = 'Start recording...';
    navigator.mediaDevices.getUserMedia({ audio: true }).then((stream) => {
      this.recorder = RecordRTC(stream, { type: 'audio' });
      this.recorder.startRecording();
      this.stopButton.disabled = false;
      this.startButton.disabled = true;
    }).catch((error) => {
      console.error('Error accessing audio stream:', error);
      this.messages.innerHTML = 'Error accessing audio stream.';
    });
  }

  stopRecording() {
    console.log('stopRecording called');
    this.messages.innerHTML = 'Stop recording...';
    if (this.recorder) {
        console.log('Recording blob before stopping:', this.recorder.getBlob());
        this.stopButton.disabled = true;
        this.recorder.stopRecording(() => {
            this.audioBlob = this.recorder.getBlob();
            this.recorder = null;
            this.startButton.disabled = false;
            console.log('Recording stopped, audioBlob:', this.audioBlob);
            this.messages.innerHTML = 'Recording stopped.';
        });
        console.log('Recording blob after stopping:', this.recorder.getBlob());
    }
  }


  submitForm(event) {
    console.log('submitForm called');
    this.messages.innerHTML = 'Submitting form...';
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
              this.messages.innerHTML = 'Audio uploaded successfully.';
              this.startButton.disabled = false;
          } else {
              console.log('Error uploading audio');
              this.messages.innerHTML = 'Error uploading audio.';
          }
      });

      event.preventDefault();
    }
  }
}
