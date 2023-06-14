import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="load-more"
export default class extends Controller {
  static targets = ["link"]

  connect() {
    console.log("LoadMore Controller works!");
  }

  loadMore(e) {
    e.preventDefault();
    fetch(this.linkTarget.href)
      .then(response => response.text())
      .then(html => {
        let parser = new DOMParser();
        let htmlDocument = parser.parseFromString(html, "text/html");
        let newPostsHtml = htmlDocument.querySelector('#posts').innerHTML;
        let newLink = htmlDocument.querySelector('#load-more a');
        document.querySelector('#posts').insertAdjacentHTML('beforeend', newPostsHtml);
        if (newLink) {
          this.linkTarget.href = newLink.href;
        } else {
          this.linkTarget.remove();
        }
      });
  }
}
