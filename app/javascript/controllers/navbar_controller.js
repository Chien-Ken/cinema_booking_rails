import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
  }
  static targets = [ "menu" ]
  toggle() {
    this.menuTarget.classList.toggle("hidden")
  }
}
