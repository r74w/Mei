$(function(){
  //Add refer tag into post textarea
  if($('form.edit_discussion').length){
    $('.action_menu a.reply').click(function(e){
      e.preventDefault();
      var t = ">" + $(this).parent().parent().attr('id').substring(1) + "\n";
      var ta = $('form textarea').first();
      if(ta.val())
        t = ta.val() + "\n" + t;
      ta.val(t).focus();
      ta[0].scrollTop = ta[0].scrollHeight;

      $('body, form').addClass('side');
    });
  } else {
    $('form.new_discussion .field').hide();
    $('#discussion_submit').addClass('link').click(function(e){
      e.preventDefault();
      $('form.new_discussion .field').show()
      $(this).unbind().removeClass();
    });
  }
  //highlight when jumping to related post
  $('a[href*=#]').click(function(){
      var elemId = '#' + $(this).attr('href').split('#')[1];
      highlight(elemId);
  });
})

function highlight(elemId){
    var elem = $(elemId);
    elem.css("backgroundColor", "#ffffff"); // hack for Safari
    elem.animate({ backgroundColor: '#ffffaa' }, 1500);
    setTimeout(function(){$(elemId).animate({ backgroundColor: "#ffffff" }, 3000)},1000);
}
