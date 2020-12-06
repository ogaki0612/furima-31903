window.addEventListener('load', function(){
  const inputPrice = document.getElementById("item-price")
  inputPrice.addEventListener('input', function(){
    const addTaxPrice = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    price = inputPrice.value
    addTaxPrice.innerHTML = price * 0.1
    profit.innerHTML = price * 0.9
  })
})