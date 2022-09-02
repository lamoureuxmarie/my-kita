import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmark"
export default class extends Controller {
  static targets = ["content"]

  connect() {
    console.log(this.contentTarget)
  }

  showContent() {
    this.contentTarget.classList.toggle("d-none")
  }
}
