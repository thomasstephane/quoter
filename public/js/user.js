$(document).ready(function() {

  function inputField(field) {
    return $('#' + field + '-input span');
  }

  function checkValid(field, errorMsg, context) {
    console.log("----checkValid for " + field + "----" );
    $.ajax({
      type: 'post',
      url: '/user/uniq',
      dataType: 'json',
      data: $(context).serialize()
    }).done(function(rsp) {
      console.log("----checkValid for " + field + "----, after ajax with " + rsp[field]);
      if (rsp[field] === "exist") {
        inputField(field).text(errorMsg);
      } else {
        inputField(field).text("");
      }
    });
  }

  function valid(name, answer, context) {
    console.log("----valid for " + name + "----");
    console.log($('#' + name + '-input'));
    if ($('#' + name + '-input input').val() !== "") {
      checkValid(name, answer, context);
    }
  }

  function validor(e, context) {
    e.preventDefault();
    console.log("----in the click event----");
    valid("name", "Name already exist, please choose another one", context);
    valid("email", "Email already taken", context);
  }

  $('#sign-up').on("change", function (e) {
    var context = this;
    validor(e, context);
  });

  $('#sign-up').on('submit', function (e) {
    e.preventDefault();
    var context = this;

    if ($('span').text() === "") {
      $.ajax({
        type: 'post',
        url: '/user',
        dataType: 'json',
        data: $('#sign-up').serialize()
      }).done(function() {
        window.location = "/";
      });
    } else {
      for (i = 0; i < 3 ; i++ ) {
        $('span').fadeTo(500, 0).fadeTo(500, 1.0);
      }
    }
  });

  $('#sign-out').on('click', function(e){
    e.preventDefault();
    $.ajax({
      type: 'delete',
      url: '/session'
    }).done(function(data){
      console.log(data);
      window.location = "/";
    });
  });

});
