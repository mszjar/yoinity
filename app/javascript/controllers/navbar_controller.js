import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["link"];

  connect() {
    this.updateActiveLink();
  }

  updateActiveLink() {
    this.linkTargets.forEach((element) => {
      const href = element.getAttribute('href');

      if (href === "/") {
        // For the home link, only add 'active' class if the current URL is exactly the root URL
        if (window.location.pathname === href) {
          element.classList.add("active");
        } else {
          element.classList.remove("active");
        }
      } else {
        // For other links, add 'active' class if the current URL includes the href
        if (window.location.href.includes(href)) {
          element.classList.add("active");
        } else {
          element.classList.remove("active");
        }
      }
    });
  }
}
