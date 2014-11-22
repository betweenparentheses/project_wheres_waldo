$(document).ready(function(){

  if($("#images-show").length){

    $("#images-show").click(function(e) {

      WW.Targeting.targetBox(this, e);

    });


    $("#waldo-image").hover(function(){
      $('.tag').show();
    },

    function(){
      $('.tag').hide();
    });

  }
});


var WW = WW || {};
WW.Targeting = (function(){

  _boxWidth = 100;
  _boxHeight = 100;

  function _getCoords(context, event){
    var offset = $(context).offset();
    var relativeX = (event.pageX - offset.left);
    var relativeY = (event.pageY - offset.top);
    return {x: relativeX, y: relativeY}
  }

  function targetBox(context, event){
    var position = _getCoords(context, event);

    // don't redraw box if interacting with its children
    if ($(event.target).parents().hasClass('target-box')){
      return;
    }


    //create an absolutely positioned div around relativeX, relativeY
    $('.target-box').remove();
    $box = $('<div class = "target-box"></div>');

    $box.css({
      height: _boxHeight + "px",
      width: _boxWidth + "px",
      top: (position.y - _boxHeight / 2 ) + "px",
      left: (position.x - _boxWidth / 2 ) + "px" 
    });
    $(context).append($box);


    $box.append('<select name = "characters"><option value = "waldo">Waldo</option></select>');
    //that div has a dropdown: populate that dropdown with selection options for characters

    //selecting a character creates a Tag associated with that character at that location

    // alert('X: ' + position.x + ', ' + 'Y: ' + position.y);

  
  }



  return { targetBox: targetBox };

})();



WW.Tagging = (function(){
  return {};
}());