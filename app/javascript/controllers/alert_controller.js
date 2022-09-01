import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="alert"
export default class extends Controller {
  connect() {
  }

  showAlert() {
    Swal.fire(
      'Success',
      'Youhou',
      'success'
    )
  }
}
