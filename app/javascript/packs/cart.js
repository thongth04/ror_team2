const increaser = document.getElementById("increase");
const descreaser = document.getElementById("descrease");
const quantity = document.getElementById("quantity");

increaser.addEventListener('click', () => {
  quantity.value = parseInt(quantity.value) + 1
  console.log(quantity.value);
});


descreaser.addEventListener('click', () => {
  quantity.value = parseInt(quantity.value);
  if (quantity.value > 1) {
    quantity.value -= 1
  }
  console.log(quantity.value);
});
