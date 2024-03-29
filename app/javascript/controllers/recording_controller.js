import { Controller } from "@hotwired/stimulus"
import RecordRTC from "recordrtc"

export default class extends Controller {
  static targets = ["start", "stop", "form", "language", "messages", "fileUpload", "audioPlayer", "timer"]

  connect() {
    this.startButton = this.startTarget
    this.stopButton = this.stopTarget
    this.form = this.formTarget
    this.languageInput = this.languageTarget
    this.messages = this.messagesTarget
    this.fileUpload = this.fileUploadTarget
    this.audioPlayer = this.audioPlayerTarget
    this.recorder = null
    this.stopButton.disabled = true
    this.audioBlob = null
    this.timer = this.timerTarget;
    this.startTime = null;
  }

  startRecording() {
    console.log('startRecording called');
    this.messages.innerHTML = 'Start recording...';
    navigator.mediaDevices.getUserMedia({ audio: true }).then((stream) => {
      this.recorder = RecordRTC(stream, { type: 'audio' });
      this.recorder.startRecording();
      this.startTimer();
      this.stopButton.disabled = false;
      this.startButton.disabled = true;
    }).catch((error) => {
      console.error('Error accessing audio stream:', error);
      this.messages.innerHTML = 'Error accessing audio stream: ' + error.message;
    });
  }

  startTimer() {
    this.startTime = Date.now();
    this.timerInterval = setInterval(() => {
      let elapsedTime = Date.now() - this.startTime;
      this.timer.innerHTML = this.formatTime(elapsedTime);
    }, 1000);
  }

  stopTimer() {
    if (this.timerInterval) {
      clearInterval(this.timerInterval);
      this.timerInterval = null;
    }
  }

  formatTime(timeInMilliseconds) {
    let totalSeconds = Math.floor(timeInMilliseconds / 1000);
    let minutes = Math.floor(totalSeconds / 60);
    let seconds = totalSeconds % 60;

    return `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
  }


  stopRecording() {
    console.log('stopRecording called');
    this.messages.innerHTML = 'Stop recording...';
    if (this.recorder) {
        console.log('Recording blob before stopping:', this.recorder.getBlob());
        this.stopButton.disabled = true;
        this.stopTimer();
        this.recorder.stopRecording(() => {
            this.audioBlob = this.recorder.getBlob();
            console.log('Recording stopped, audioBlob:', this.audioBlob);
            this.messages.innerHTML = 'Recording stopped.';

            // Added these lines - Convert the audioBlob to a URL and set it as the source for the audioPlayer
            let audioURL = URL.createObjectURL(this.audioBlob);
            this.audioPlayer.src = audioURL;

            this.recorder = null;
            this.startButton.disabled = false;
        });
        console.log('Recording blob after stopping:', this.recorder.getBlob());
      }
  }

  submitForm(event) {
    console.log('submitForm called');
    this.messages.innerHTML = 'Submitting form...';
    let formData = new FormData(this.form);
    //stop timer
    this.stopTimer();
    // Check if file was uploaded
    if (this.fileUpload.files.length > 0) {
      let file = this.fileUpload.files[0];
      formData.append('audio', file, file.name);
    } else if (this.audioBlob) {
      // If no file uploaded, add audioBlob (recorded audio) to form data
      formData.append('audio', this.audioBlob, 'recorded_audio.wav');
    } else {
      // If no file uploaded and no audio recorded, do not submit form
      this.messages.innerHTML = 'Please record or upload audio.';
      event.preventDefault();
      return;
    }

    formData.set('language', this.languageInput.value);

    fetch(this.form.action, {
        method: 'POST',
        body: formData
    }).then(response => {
        if (response.ok) {
            response.json().then(data => {
              if (data.next_url) {
                // Added this line - If server responds with a URL for the next page, redirect to that page
                window.location.href = data.next_url;
              } else {
                console.log('Audio uploaded successfully');
                this.messages.innerHTML = 'Audio uploaded successfully.';
                this.startButton.disabled = false;
              }
            });
        } else {
            // handle error response
            response.json().then(data => {
                console.log('Error uploading audio: ', data);
                if (data.errors && data.errors.audio) {
                    this.messages.innerHTML = 'Error uploading audio: ' + data.errors.audio;
                } else {
                    this.messages.innerHTML = 'Error uploading audio.';
                }
            });
        }
    });

    event.preventDefault();
  }

}
