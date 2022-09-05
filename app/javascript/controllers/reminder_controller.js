import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reminder"
export default class extends Controller {
  static targets = ['content']

  showContent() {
    this.contentTarget.classList.toggle("d-none")
  }

  hideContent() {
    this.contentTarget.classList.add("d-none")
  }
}
