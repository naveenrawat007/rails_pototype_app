// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery-ui
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).ready(function () {

  var modal = document.getElementById('t-modal')
  $("#create-task").click(function () {
    modal.style.display = "block";
  })
  $("#quit").click(function () {
    modal.style.display = "none"
  })

  $("#task-form").submit(function () {
    modal.style.display = "none"
    // document.getElementById("task-form").reset();
  })

  $("#date").datepicker();
  $( "#date" ).datepicker( "option", "dateFormat", "dd/mm/yy" );

  window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
    }
  }

var owner = $('#owner'),
    cardNumber = $('#cardNumber'),
    cardNumberField = $('#card-number-field'),
    CVV = $("#cvv"),
    confirmButton = $('#confirm-purchase')

    cardNumber.payform('formatCardNumber');
    CVV.payform('formatCardCVC');

  cardNumber.keyup(function() {
    if ($.payform.validateCardNumber(cardNumber.val()) == false) {
        cardNumberField.removeClass('success');
        cardNumberField.addClass('error');
        console.log("error");
    } else {
        cardNumberField.removeClass('error');
        cardNumberField.addClass('success');
        console.log("sucess");
    }

  })


})
