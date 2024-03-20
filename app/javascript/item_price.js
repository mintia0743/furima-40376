document.addEventListener("DOMContentLoaded", () => {
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  const priceInput = document.getElementById("item-price");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const tax = Math.floor(inputValue * 0.1);
      const profit = inputValue - tax;

      if (!isNaN(profit) && !isNaN(tax)) {
        addTaxDom.textContent = tax.toLocaleString();
        profitDom.textContent = profit.toLocaleString();
      } else {
        addTaxDom.textContent = "0";
        profitDom.textContent = "0";
      }
    });
  }
});
document.addEventListener("ajax:error", (event) => {
  const [data, _status, _xhr] = event.detail;
  const errors = data.errors;

  console.error("Validation Error:", errors);
});
