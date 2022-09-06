import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  submit() {
    console.log("hi")
    this.element.submit();
  }
}
