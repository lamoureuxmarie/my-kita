import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("hello, its connected")
  }

  openForm() {
    console.log("It's open")
    this.formTarget.classList.remove("d-none");
  }

  closeForm() {
    console.log("It's close")
    this.formTarget.classList.add("d-none");
  }
}
