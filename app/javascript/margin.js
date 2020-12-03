function margin(){
  var item = document.getElementById("item-price");
  var add = document.getElementById("add-tax-price");
  var total = document.getElementById("profit");
  item.addEventListener("keyup", function(){
  var items = item.value;
  var calc = items * 0.1;
  var prof = items - (items * 0.1);
  add.innerHTML = Math.floor(calc);
  total.innerHTML = Math.floor(prof);
  })
}
window.addEventListener("load", margin);