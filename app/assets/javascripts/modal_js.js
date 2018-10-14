$('.button_modal').click(function(){
  var buttonId = $(this).attr('id');
  $('#modal-container').removeAttr('class').addClass(buttonId);
  $('body').addClass('modal-active');
})

$('#close').click(function(){
  $(this).addClass('out');
  $('body').removeClass('modal-active');
});