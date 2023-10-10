document.addEventListener('turbo:load', function() {
	class CartItem {
		constructor(element) {
			this.element = element;
			this.quantityElement = element.querySelector('.quantity');
			this.priceElement = element.querySelector('.product-price');
			this.totalElement = element.querySelector('.item-total');
			this.quantity = parseInt(this.quantityElement.textContent);
			this.price = parseFloat(this.priceElement.textContent.replace('$', '').replace(',', ''));
		}

	updateQuantity(action) {
		if (action === 'increment') {
			this.quantity++;
		} else if (action === 'decrement' && this.quantity > 1) {
			this.quantity--;
		}
		this.quantityElement.textContent = this.quantity;
		this.updateTotal();
	}

	updateTotal() {
		const totalPrice = this.quantity * this.price;
		this.totalElement.textContent = `$${totalPrice.toFixed(2)}`;
	}
}
// Get all quantity buttons with the class 'quantity-btn'
const quantityButtons = document.querySelectorAll('.quantity-btn');

// Create CartItem objects for each cart row
const cartItems = Array.from(document.querySelectorAll('.cart-row')).map((element) => new CartItem(element));

// Loop through each quantity button and add click event listener
	quantityButtons.forEach((button) => {
		button.addEventListener('click', (event) => {
			const action = event.target.getAttribute('data-action');
			const cartItem = cartItems.find((item) => item.element.contains(event.target));
			cartItem.updateQuantity(action);
		});
	});
});
