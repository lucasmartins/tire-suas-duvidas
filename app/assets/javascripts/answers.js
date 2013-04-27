$('.up-vote').click(function(){
  var answer_id = $(this).attr('data');
  $.post('/vote/'+answer_id+'/up', function(data) {
    $('#answer-balance-'+answer_id).text(data)
  });
});

$('.down-vote').click(function(){
  var answer_id = $(this).attr('data');
  $.post('/vote/'+answer_id+'/down', function(data) {
    $('#answer-balance-'+answer_id).text(data)
  });
});