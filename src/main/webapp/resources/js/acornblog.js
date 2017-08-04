var collapsed=false;
var doing=false;

$(".dropdown-toggle").click(function(){
  if($(this).next(".dropdown-menu").css("display")=="none"){
    $(this).next(".dropdown-menu").siblings(".dropdown-menu").slideUp(400);
    $(this).next(".dropdown-menu").slideDown(400);
  }else{
    $(this).next(".dropdown-menu").slideUp(400);
  }
});

function collapse(e){
  if(collapsed==false){
    if(doing==true){
      return;
    }
    doing=true;
    collapsed=true;
    $("body").addClass("bodyfix");
    $(".collapsebox").addClass("collapsed");
    $(".backdrop").css("top", $(window).height()/2+"px")
    .css("left", $(window).width()/2+"px").show()
    .animate({
      width:$(window).width()*2+"px",
      height:$(window).height()*2+"px",
      top:"-50%",
      left:"-50%"
    }, 400, function(){
      $.each($(".backdrop > ul > li"), function(i, l){
        setTimeout(function(){
          $(".backdrop > ul > li").eq(i).animate({
            opacity:1.0,
            marginTop:"0px"
          }, 200)
        }, i*200);
        if($(".backdrop > ul > li").eq(i).index()==$(".backdrop > ul > li").last().index()){
          setTimeout(function(){doing=false;}, ($(".backdrop > ul > li").last().index()+1)*200);
        }
      });
    });

  }else if(collapsed==true){
    if(doing==true){
      return;
    }
    doing=true;
    collapsed=false;
    $("body").removeClass("bodyfix");
    $(".collapsebox").removeClass("collapsed");
    $(".backdrop > ul > li").css("opacity", "0").css("margin-top", "40px");
    $(".backdrop").animate({
      width:"0px",
      height:"0px",
      top:$(window).height()/2+"px",
      left:$(window).width()/2+"px"
    }, 400, function(){
      $(this).hide();
      doing=false;
    });
  }
}

$(window).on("resize", function(){
  if(collapsed==true){
    $(".backdrop").css("width", $(window).width()*2+"px")
    .css("height", $(window).height()*2+"px");
  }
  if($(window).width()>990){
    if(collapsed==true){
      if(doing==true){
        return;
      }
      doing=true;
      collapsed=false;
      $("body").removeClass("bodyfix");
      $(".collapsebox").removeClass("collapsed");
      $(".backdrop > ul > li").css("opacity", "0").css("margin-top", "40px");
      $(".backdrop").animate({
        width:"0px",
        height:"0px",
        top:$(window).height()/2+"px",
        left:$(window).width()/2+"px"
      }, 400, function(){
        $(this).hide();
        doing=false;
      });
    }
  }
});
