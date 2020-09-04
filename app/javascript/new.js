window.addEventListener("load", function() {
  const priceArea = document.getElementById("item-price")
  priceArea.addEventListener('input', function(){
    const price = document.getElementById("item-price").value; 
    charge = price * 0.1;
    profit = price - charge;

    chargeArea = document.getElementById("add-tax-price");
    profitArea = document.getElementById("profit");

    chargeArea.textContent = Math.floor(charge);
    profitArea.textContent = Math.floor(profit);
  });
});

