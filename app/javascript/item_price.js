window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const feeDisplay = document.getElementById("add-tax-price");
  const ProfitDisplay = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  });
});