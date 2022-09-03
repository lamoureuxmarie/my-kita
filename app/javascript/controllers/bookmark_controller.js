import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmark"
export default class extends Controller {
  static targets = ['content', 'up', 'down']

  connect() {
    console.log(this.contentTarget)
  }

  showContent() {
    this.contentTarget.classList.toggle("d-none")
    this.upTarget.classList.toggle('d-none')
    this.downTarget.classList.toggle('d-none')
  }
}
