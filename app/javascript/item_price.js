const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");
const priceInput = document.getElementById("item-price");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const tax = Math.floor(inputValue * 0.1);
  const profit = inputValue - tax;

  addTaxDom.textContent = tax.toLocaleString();
  profitDom.textContent = profit.toLocaleString();
});