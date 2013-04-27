console.log('loaded questions.js');

$(document).ready(function() {
  $('.question').click(function(){
    window.location = '/questions/'+$(this).attr('data')
  });

  var tid = setInterval(update_hits, 2000);
  function update_hits() {
    console.log('interval!');
    $.post('/hits', function(data) {
      $.each(data, function(index, value) {
        $('.question[data*="'+value['id']+'"]').children()[2].innerHTML=value['hits']
      });
    });
  }

});
