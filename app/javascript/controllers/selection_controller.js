import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selection"
export default class extends Controller {
  static targets = ["seat", "count", "total", "seatNames", "submitButton"]
  static values = { price: Number, showtimeId: String }
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
    this.updateLink()
  }

  updateSummary() {
    const count = this.selectedSeats.length
    this.countTarget.innerText = count
    this.totalTarget.innerText = `$${(count * this.priceValue).toFixed(2)}`
    this.seatNamesTarget.innerText = this.selectedSeats.sort().join(", ") || "None"
  }

  updateLink() {
    const button = this.submitButtonTarget
    
    if (this.selectedSeats.length > 0) {
      // Build the URL: /payments/new?showtime_id=1&seat_ids[]=A1&seat_ids[]=A2
      const params = new URLSearchParams()
      params.append("showtime_id", this.showtimeIdValue)
      this.selectedSeats.forEach(name => params.append("seat_ids[]", name))

      button.href = `/payments/new?${params.toString()}`
      
      // Make button look active
      button.classList.remove("opacity-50", "pointer-events-none")
    } else {
      button.href = "#"
      button.classList.add("opacity-50", "pointer-events-none")
    }
  }
  
}
