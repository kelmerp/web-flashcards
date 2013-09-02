$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('.flip').click(function(){
    $(this).find('.card').toggleClass('flipped');
    return false;
  });

  $('.submit_button').click(function(){
    $(this).find('.card').toggleClass('flipped');
    return false;
  });

  $('.music a').click(function() {
    $('.music a').replaceWith('<a href="">Music: OFF</a>');;
  });
});
