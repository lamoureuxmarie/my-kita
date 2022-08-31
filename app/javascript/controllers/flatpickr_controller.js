import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    console.log('test')
    flatpickr(".datepicker", {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      minDate: "today"
    });
  }
}
