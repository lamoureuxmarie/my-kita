import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="alert"
export default class extends Controller {
  static values = { redirectUrl: String}
  connect() {
    console.log('Controller connected', this.redirectUrlValue)
  }

  showAlert() {
    console.log('Hello from showAlert')
    Swal.fire({
      imageUrl: 'https://i.ibb.co/Jt71fBz/sun.png',
      imageWidth: 80,
      imageHeight: 80,
      imageAlt: 'Sun Icon',
      title: 'Added Successfully!',
      showConfirmButton: true,
      showDenyButton: true,
      confirmButtonText: `<a href="${this.redirectUrlValue}">See list</a>`,
      confirmButtonColor: '#FFE23F',
      denyButtonText: 'Go Back',
      denyButtonColor: '#F5F1E9'
    })
  }
}
