import { Controller } from "@hotwired/stimulus"
import RecordRTC from "recordrtc"

export default class extends Controller {
  static targets = ["start", "stop"]

  connect() {
    this.startButton = this.startTarget
    this.stopButton = this.stopTarget
    this.recorder = null // initialize the recorder variable here
    this.stopButton.disabled = true
  }

  startRecording() {
    navigator.mediaDevices.getUserMedia({ audio: true }).then((stream) => {
      this.recorder = RecordRTC(stream, { type: 'audio' });
      this.recorder.startRecording();
      this.stopButton.disabled = false;
      this.startButton.disabled = true;
    });
  }

  stopRecording() {
    if (this.recorder) { // check if recorder is not null before trying to stop it
      this.stopButton.disabled = true;
      this.recorder.stopRecording(() => {
        let blob = this.recorder.getBlob();
        this.uploadBlobToServer(blob);
        this.recorder = null; // reset the recorder after the recording is stopped
        this.startButton.disabled = false;
      });
    }
  }

  uploadBlobToServer(blob) {
    let formData = new FormData();
    formData.append('audio', blob);

    fetch('/upload', {
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
  }
}
