const increaser = document.getElementById("btnIncrease");
const descreaser = document.getElementById("btnDescrease");
const quantity = document.getElementById("itemQuantity");


increaser && increaser.addEventListener('click', () => {
  quantity.value = parseInt(quantity.value) + 1
  console.log(quantity.value);
});


descreaser && descreaser.addEventListener('click', () => {
  quantity.value = parseInt(quantity.value);
  if (quantity.value > 1) {
    quantity.value -= 1
  }
  console.log(quantity.value);
});
