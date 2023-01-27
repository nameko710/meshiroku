const { each } = require("jquery");

var minCount = 1;
var maxCount = 10;

$(function(){
$('#demo-plus').on('click', function(){
  var inputCount = $('#demo-area .unit').length;
  if (inputCount < maxCount){
    var element = $('#demo-area .unit:last-child').clone(true);
    $('#demo-area .unit').parent().append(element);
    inputFood = $('#demo-area .unit').find('#form_fridge_collection_fridges_attributes_0_food')
    $(inputFood).each(function(i){
      $(this).attr('name', 'form_fridge_collection[fridges_attributes][' + (i+1) + '][food]')
    });
    inputTitle = $('#demo-area .unit').find('#form_fridge_collection_fridges_attributes_0_amount')
    $(inputTitle).each(function(i){
      $(this).attr('name', 'form_fridge_collection[fridges_attributes][' + (i+1) + '][amount]')
    });
    inputTitle = $('#demo-area .unit').find('#form_fridge_collection_fridges_attributes_0_unit')
    $(inputTitle).each(function(i){
      $(this).attr('name', 'form_fridge_collection[fridges_attributes][' + (i+1) + '][unit]')
    });
    inputTitle = $('#demo-area .unit').find('#form_fridge_collection_fridges_attributes_0_price')
    $(inputTitle).each(function(i){
      $(this).attr('name', 'form_fridge_collection[fridges_attributes][' + (i+1) + '][price]')
    });
    inputTitle = $('#demo-area .unit').find('#form_fridge_collection_fridges_attributes_0_id')
    $(inputTitle).each(function(i){
      $(this).attr('name', 'form_fridge_collection[fridges_attributes][' + (i+1) + '][id]')
    });
  }
});
$('.demo-minus').on('click', function(){
  var inputCount = $('#demo-area .unit').length;
  if (inputCount > minCount){
    $(this).parents('.unit').remove();
  }
});
});
