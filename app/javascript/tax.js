function tax (){
  
  const itemPrice =document.getElementById("item-price"); 
  itemPrice.addEventListener("keyup", () => {
    const fee = Math.floor(itemPrice.value * 0.1);

    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${fee}`;
    const salesProfit = Math.floor(itemPrice.value - fee);

    const profit = document.getElementById("profit");
    profit.innerHTML = `${salesProfit}`;
  });
};

window.addEventListener('load', tax);
