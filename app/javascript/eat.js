const { each } = require("jquery");

$(function(){
  const fridgeObjects = fridge_objects;
  $('.total__price').attr('readonly', true);

  $('.food__id').on('change', function(){
    $('.food__id').each(function(i){
     var selectID = $(this).next('.select__id');
     var selectFood = $(this).val();
     selectID.text(selectFood);
    })
  });

  $('.food__amount').on('input', function(){
    var Price = 0
    var addPrice = 0
    $('.food__amount').each(function(i){
      var inputAmount = $(this).val();
      var selectID = $(this).prev('.select__id');
      var foodID = Number(selectID.text());
      var recode = ((v) => {return v.id === foodID })
      var result = fridgeObjects.find(recode) 
      
      Price = Number(result.price) / Number(result.amount) * Number(inputAmount)
      console.log(Price)

      addPrice = Math.floor(Number(addPrice) + Price)
    });
    
    $('.total__price').val(addPrice);
  });
});

