import { Controller } from "@hotwired/stimulus"
import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css'; // Optional for styling

export default class extends Controller {
  connect() {
    tippy(this.element, {
      content: this.data.get('content'),
      // Add more options here if needed
    });
  }
}
