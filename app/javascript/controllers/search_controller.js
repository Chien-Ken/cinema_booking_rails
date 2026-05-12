import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  update() {
    // We wait 300ms so we don't spam the server for every single letter
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.querySelector('form').requestSubmit()
    }, 300)
  }
}