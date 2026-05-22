import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["submitButton", "buttonText","timerText"]
  static values = { clientSecret: String, publishableKey: String }

  connect() {
    this.stripe = Stripe(this.publishableKeyValue)
    
    // 1. Add Styling so Stripe matches your Zinc-950 UI
    const appearance = {
      theme: 'night',
      variables: {
        colorPrimary: '#ef4444',     // Red-500
        colorBackground: '#09090b',  // Zinc-950
        colorText: '#ffffff',
        colorDanger: '#df1b41',
        fontFamily: 'ui-sans-serif, system-ui, sans-serif',
        borderRadius: '12px',
      }
    }

    this.elements = this.stripe.elements({ 
      clientSecret: this.clientSecretValue,
      appearance 
    })

    // 2. Create and Mount ALL THREE elements
    this.cardNumber = this.elements.create('cardNumber')
    this.cardNumber.mount('#card-number')

    this.cardExpiry = this.elements.create('cardExpiry')
    this.cardExpiry.mount('#card-expiry')

    this.cardCvc = this.elements.create('cardCvc')
    this.cardCvc.mount('#card-cvc')

     this.startTimer()
  }

  async handleSubmit(event) {
    event.preventDefault()

    this.submitButtonTarget.disabled = true
    this.buttonTextTarget.innerText = "PROCESSING..."

    const { error, paymentIntent } = await this.stripe.confirmCardPayment(this.clientSecretValue, {
      payment_method: {
        card: this.cardNumber, 
        billing_details: {
          name: document.getElementById('cardholder-name').value
        }
      }
    })

    if (error) {
      alert(error.message)
      this.submitButtonTarget.disabled = false
      this.buttonTextTarget.innerText = "CONFIRM & PAY"
    } else if (paymentIntent.status === 'succeeded') {
      window.location.href = "/payments/success?payment_intent=" + paymentIntent.id;
    }
  }

  startTimer() {
  let timeLeft = 10 * 60 

  this.timer = setInterval(() => {
    const minutes = Math.floor(timeLeft / 60)
    const seconds = timeLeft % 60

    this.timerTextTarget.innerText =
      `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`

    if (timeLeft <= 0) {
      clearInterval(this.timer)

      alert("Seat hold expired!")

      // Optional: redirect user
      window.location.href = "/"
    }

    timeLeft--
  }, 1000)
}
}