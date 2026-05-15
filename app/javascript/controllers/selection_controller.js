import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selection"
export default class extends Controller {
  static targets = ["seat", "count", "total", "seatNames"]
  static values = { price: Number }
  connect() {
    this.selectedSeats = []
  }

  toggle(event) {
    const seatBtn = event.currentTarget
    const seatId = seatBtn.dataset.seatId
    const seatName = seatBtn.dataset.seatName

    if (this.selectedSeats.includes(seatName)) {
      // Unselect
      this.selectedSeats = this.selectedSeats.filter(s => s !== seatName)
      seatBtn.classList.remove("bg-red-600", "border-red-600", "text-white")
      seatBtn.classList.add("border-emerald-500", "text-emerald-500")
    } else {
      // Select
      this.selectedSeats.push(seatName)
      seatBtn.classList.add("bg-red-600", "border-red-600", "text-white")
      seatBtn.classList.remove("border-emerald-500", "text-emerald-500")
    }

    this.updateSummary()
  }

  updateSummary() {
    const count = this.selectedSeats.length
    this.countTarget.innerText = count
    this.totalTarget.innerText = `$${(count * this.priceValue).toFixed(2)}`
    this.seatNamesTarget.innerText = this.selectedSeats.sort().join(", ") || "None"
  }
  
}
