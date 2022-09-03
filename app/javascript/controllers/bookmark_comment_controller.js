import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmark-comment"
export default class extends Controller {
  static targets = ['input']

  showForm() {
    this.inputTarget.classList.toggle('d-none')
  }

  hideForm() {
    this.inputTarget.classList.add('d-none')
  }
}
