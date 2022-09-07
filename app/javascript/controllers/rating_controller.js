import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating"
export default class extends Controller {
  static targets = ["form"]

  connect() {
  }

  openForm() {
    this.formTarget.classList.remove("d-none");
  }

  closeForm() {
    this.formTarget.classList.add("d-none");
  }
}
