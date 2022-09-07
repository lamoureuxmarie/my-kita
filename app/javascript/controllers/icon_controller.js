import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="icon"
export default class extends Controller {
  static targets = ["iconDrop", "heartIcon", "envelopeIcon", "phoneIcon", "calendarIcon", "commentIcon", "dropDown"]

  connect() {
  }

  changeIcon(event) {
    // primeiro empty the old class of current icon
    // add the right class to current icon
    const mainIcon = this.iconDropTarget
    const clickedIcon = event.target
    const clickedIconClasses = [...clickedIcon.classList]
    const mainIconClasses = [...mainIcon.classList]
    mainIcon.removeAttribute("class")
    clickedIcon.removeAttribute("class")
    clickedIconClasses.forEach(className => mainIcon.classList.add(className))
    mainIconClasses.forEach(className => clickedIcon.classList.add(className))
    this.dropDownTarget.classList.remove("show")
  }
}
