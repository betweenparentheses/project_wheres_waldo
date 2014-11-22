$(document).ready(function(){

  if($("#images-show").length){

    $("#images-show").click(function(e) {

      WW.Targeting.targetBox(this, e);

    });


    $(".waldo-image").hover(function(){
      $('.tag').show();
    },

    function(){
      $('.tag').hide();
    });

    $('#images-show').on('click', 'input', function(e){
      e.preventDefault();
      var newTag = WW.Tagging.addTag($(e.target).prev().val(), WW.Targeting.currentPosition());
      WW.Tagging.showTag(newTag);
    });

  }
});


var WW = WW || {};
WW.Targeting = (function(){

  var _boxWidth = 100;
  var _boxHeight = 100;
  var position = {};

  function _getCoords(context, event){
    var offset = $(context).offset();
    var relativeX = (event.pageX - offset.left);
    var relativeY = (event.pageY - offset.top);
    return {x: relativeX, y: relativeY};
  }

  function currentPosition(){
    return position;
  }

  function targetBox(context, event){
    position = _getCoords(context, event);

    // don't redraw box if interacting with its children
    if ($(event.target).parents().hasClass('target-box')){
      return;
    }


    //create an absolutely positioned div around relativeX, relativeY
    $('.target-box').remove();
    var $box = $('<div class = "target-box"></div>');

    $box.css({
      height: _boxHeight + "px",
      width: _boxWidth + "px",
      top: (position.y - _boxHeight / 2 ) + "px",
      left: (position.x - _boxWidth / 2 ) + "px"
    });
    $(context).append($box);


    //that div has a dropdown: populate that dropdown with selection options for characters
    $box.append('<select name = "characters"><option value = "Waldo">Waldo</option></select>');
    $box.append('<input value="Tag me!" type="submit"></input>');

    //selecting a character creates a Tag associated with that character at that location

    // alert('X: ' + position.x + ', ' + 'Y: ' + position.y);


  }



  return { targetBox: targetBox,
            currentPosition: currentPosition };

})();





WW.Tagging = (function(){


  var tags = {};
  var _tagHeight = 100;
  var _tagWidth = 100;

  function addTag(character, position){
    var newTag = new Tag(character, position);
    tags[character] = newTag;
    return newTag;
  }

  function Tag(character, position){
    this.position = position;
    this.character = character;
  }

  function showTag(tag){
    $('.target-box').remove();

    // remove any previous divs that showed this tag elsewhere
    $('#'+tag.character).remove();

    var $tag = $('<div class = "tag" id = '+ tag.character +'></div>');

    $tag.css({
      height: _tagHeight + "px",
      width: _tagWidth + "px",
      top: (tag.position.y - _tagHeight / 2 ) + "px",
      left: (tag.position.x - _tagWidth / 2 ) + "px"
    });
    $('#images-show').append($tag);

    $tag.append('<p>' + tag.character + '</p>');


  }

  return { Tag: Tag,
          tags: tags,
          addTag: addTag,
          showTag: showTag };

}());

