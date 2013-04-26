console.log('loaded questions.js');

$(document).ready(function() {
  $('.question').click(function(){
    window.location = '/questions/'+$(this).attr('data')
  });
});