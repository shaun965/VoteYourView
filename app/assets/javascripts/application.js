// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require fotorama
//= require foundation
//= require jquery.tooltipster.min.js
//= require_tree .
// any other code etc
//= require turbolinks


    $(function () {
      $('.alert').click(function () {

        var questionId = $( this ).next().html();
        var currentDiv = $( this )[0]
        var yesDiv = $( this ).parent().children(".yesss")[0];
        var noDiv = $( this ).parent().children(".nooo")[0];
        

        if ($(this).attr('class') == "alert yesss")
        {

          var domElement = $( this ).parent().children(".yess").children("div").html();
          var a = parseInt(domElement)+1;
          var b = $( this ).parent().children(".yess").children("div")[0];
          
         $.ajax({
            type: "post",
            url: "/updateVote",
            data: {yes: true, question_id: questionId },
            success: function(resp){
              b.innerHTML = a;
              currentDiv.remove();
              noDiv.remove();
            }

          });
        }
        else        
        {
          var domElement = $( this ).parent().children(".noo").children("div").html();
          var a = parseInt(domElement)+1;
          var b = $( this ).parent().children(".noo").children("div")[0];

          $.ajax({
            type: "post",
            url: "/updateVote",
            data: {yes: false, question_id: questionId },
            success: function(resp){ 
              b.innerHTML = a;
              currentDiv.remove();
              yesDiv.remove();
            }
          });

        }

      })
    });

