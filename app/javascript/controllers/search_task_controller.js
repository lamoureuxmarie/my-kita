import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-task"
export default class extends Controller {
  static targets = ["input"]

  connect() {
  }

  showSearch() {
    this.inputTarget.classList.toggle("d-none")
  }
}
