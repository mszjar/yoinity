import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  connect() {
    this.checkoutButton = document.getElementById('checkout-button');
    this.stripe = Stripe('pk_test_51NAnqEJmS8EflGBbwSrFkI5BWTMxxXgVaOHjjUR2z6beW5BgSa5qdLliqbayLkuyEh0fjqmbXqX7TJcuBkfRcBvZ00QbFryovp'); // replace with your actual Stripe publishable key
  }

  checkout(e) {
    e.preventDefault();

    fetch('/checkout', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      }
    }).then(response => response.json())
      .then(data => {
        this.stripe.redirectToCheckout({
          sessionId: data.id
        }).then((result) => {
          if (result.error) {
            alert(result.error.message);
          }
        });
      }).catch(error => console.log(error));
  }
}
