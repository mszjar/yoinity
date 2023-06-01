import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["tab", "notification"];

  connect() {
  }

  changeTab(event) {
    event.preventDefault()
    const tabs = Array.from(this.tabTargets)
    tabs.forEach((tab) => {
      tab.classList.remove("active")
    })
    event.currentTarget.classList.add("active")
    console.log(event.currentTarget.innerHTML)
    console.log(event.currentTarget.dataset)

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

}
