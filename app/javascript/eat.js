window.addEventListener('load', function (){
  const fridgeObjects = fridge_objects;
  let select = document.getElementById('form_fridge_collection_fridges_attributes_0_id');

  select.onchange = () => {
    const foodID = select.selectedIndex;
    console.log(foodID)
    const result = fridgeObjects.find((v) => v.id === foodID);
    const nowAmount = result.amount;
    const foodUnit = result.unit;
    const addAmountDom = document.getElementById('now-amount');
    const addUnit1Dom = document.getElementById('unit1');
    addAmountDom.innerHTML = nowAmount
    addUnit1Dom.innerHTML = foodUnit
    const amountInput = document.getElementById("amount");
      amountInput.addEventListener("input", () => {
        const inputValue = amountInput.value;
        const addUnit2Dom = document.getElementById('unit2');
        const addRemainingDom = document.getElementById('remaining-amount');
        const afterAmount = Math.floor(nowAmount - inputValue);
        addRemainingDom.innerHTML = afterAmount;
        addUnit2Dom.innerHTML = foodUnit
        const expense = Math.floor((inputValue / nowAmount) * result.price);
        const balance = Math.floor(result.price - expense);
        const addExpenseDom = document.getElementById('using-price');
        addExpenseDom.innerHTML = expense;
    })
  };
})
