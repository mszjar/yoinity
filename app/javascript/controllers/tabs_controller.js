import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["tab", "notification"];

  connect() {
    // any code you want to run when the controller instance connects to the DOM
  }

  changeTab(event) {
    event.preventDefault();

    console.log("changeTab method triggered"); // Debugging Step 1

    const tabs = Array.from(this.tabTargets);
    tabs.forEach((tab) => {
      tab.classList.remove("active");
    });

    event.currentTarget.classList.add("active");

    let anchorTagInnerHTML = event.currentTarget.querySelector('a').innerHTML.trim();
    console.log(anchorTagInnerHTML); // Debugging to make sure you're getting "Following"

    if(anchorTagInnerHTML === 'Following'){
      fetch('/p/following')
        .then(response => {
          if (!response.ok) { // Debugging Step 3
            throw new Error(`HTTP error! status: ${response.status}`);
          }
          return response.text();
        })
        .then(html => {
          this.insertHtml('#posts', html);
        })
        .catch(e => {
          console.log('There was an error with fetch!', e); // Debugging Step 3
        });
    } else if (anchorTagInnerHTML === 'Explore') {
      // fetch code for 'Explore'
      fetch('/p')
        .then(response => {
          if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
          }
          return response.text();
        })
        .then(html => {
          this.insertHtml('#posts', html);
        })
        .catch(e => {
          console.log('There was an error with fetch!', e);
        });
    }

    const notifications = Array.from(this.notificationTargets)
    notifications.forEach((notification) => {
      notification.classList.add("d-none")
      if (event.currentTarget.dataset.tabsValue === "story") {
        if (notification.classList[1] === "story") {
          notification.classList.remove("d-none")
        }
      } else if (event.currentTarget.dataset.tabsValue === "reviews") {
        if (notification.classList[1] === "reviews") {
          notification.classList.remove("d-none")
        }
      } else {
        notification.classList.remove("d-none")
      }
    })
  }

  insertHtml(selector, html) {
    const target = document.querySelector(selector);
    target.innerHTML = '';
    let parser = new DOMParser();
    let htmlDocument = parser.parseFromString(html, "text/html");
    let postsHtml = htmlDocument.querySelector('#posts');
    if (postsHtml) {
      postsHtml = postsHtml.innerHTML;
    } else {
      postsHtml = html; // use the full html if no '#posts' is found
    }
    target.innerHTML = postsHtml;
  }

}
