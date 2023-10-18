document.addEventListener('turbo:load', function() {
  class LineItem {
    constructor(element, csrfToken) {
      this.element = element;
      this.quantityElement = element.querySelector('.quantity');
      this.priceElement = element.querySelector('.product-price');
      this.totalElement = element.querySelector('.item-total');
      this.itemId = element.querySelector('.product-id').getAttribute('data-product-id');
      this.quantity = parseInt(this.quantityElement.textContent);
      this.price = parseFloat(this.priceElement.textContent.replace('$', '').replace(',', ''));
      this.csrfToken = csrfToken;
    }

    async updateQuantity(action) {
      if (action === 'increment') {
        this.quantity++;
      } else if (action === 'decrement' && this.quantity > 1) {
        this.quantity--;
      }

      this.quantityElement.textContent = this.quantity;
      this.updateTotal();

      // Make an AJAX call to update the item quantity on the server
      try {
        const response = await fetch(`/update_quantity/${this.itemId}?action=update_quantity&data_action=${action}`, {
          method: 'POST',
          headers: {
            'Accept': 'text/vnd.turbo-stream.html',
            'X-CSRF-Token': this.csrfToken,
          },
        });

        if (response.ok) {
          // The Turbo Stream response will automatically update the item quantity in the view
        } else {
          console.error('Failed to update item quantity.');
        }
      } catch (error) {
        console.error('An error occurred:', error);
      }

      updateCartTotal();
    }

    updateTotal() {
      const totalPrice = this.quantity * this.price;
      this.totalElement.textContent = `$${totalPrice.toFixed(2)}`;
    }
  }

  // Get all quantity buttons with the class 'quantity-btn'
  const quantityButtons = document.querySelectorAll('.quantity-btn');

  // Create LineItem objects for each cart row
  const csrfToken = document.querySelector("meta[name=csrf-token]").content;
  const lineItems = Array.from(document.querySelectorAll('.cart-row')).map((element) => new LineItem(element, csrfToken));

  // Function to update the cart total
  function updateCartTotal() {
    let cartTotal = 0;
    lineItems.forEach((item) => {
      cartTotal += item.quantity * item.price;
    });
    const totalPriceElement = document.querySelector('.total-price-section p');
    totalPriceElement.textContent = `$${cartTotal.toFixed(2)}`;
  }

  // Loop through each quantity button and add click event listener
  quantityButtons.forEach((button) => {
    button.addEventListener('click', async (event) => {
      const action = event.target.getAttribute('data-action');
      const lineItem = lineItems.find((item) => item.element.contains(event.target));
      if (lineItem) {
        // Update the quantity locally before making the AJAX call
        lineItem.updateQuantity(action);
      }
    });
  });
});
