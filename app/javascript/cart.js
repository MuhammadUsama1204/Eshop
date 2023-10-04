document.addEventListener("DOMContentLoaded", function () {
  const decreaseButtons = document.querySelectorAll(".decrease-quantity");
  const increaseButtons = document.querySelectorAll(".increase-quantity");

  decreaseButtons.forEach((button) => {
    button.addEventListener("click", function () {
      const lineItemId = button.getAttribute("data-line-item-id");
      const input = document.querySelector(`.quantity-input[data-line-item-id="${lineItemId}"]`);
      const currentValue = parseInt(input.value);

      if (currentValue > 1) {
        input.value = currentValue - 1;
        updateCart(lineItemId, currentValue - 1);
      }
    });
  });

  increaseButtons.forEach((button) => {
    button.addEventListener("click", function () {
      const lineItemId = button.getAttribute("data-line-item-id");
      const input = document.querySelector(`.quantity-input[data-line-item-id="${lineItemId}"]`);
      const currentValue = parseInt(input.value);

      input.value = currentValue + 1;
      updateCart(lineItemId, currentValue + 1);
    });
  });
});
