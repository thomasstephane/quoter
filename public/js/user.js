$(document).ready(function() {

  function inputField(field) {
    return $('.' + field + '-signup span');
  }

  function checkValid(field, errorMsg, context) {
    $.ajax({
      type: 'post',
      url: '/user/uniq',
      dataType: 'json',
      data: $(context).serialize()
    }).done(function(data) {
      if (data[field] === "exist") {
        inputField(field).text(errorMsg);
      } else {
        inputField(field).text("");
      }
    });
  }

  function valid(name, answer, context) {
    if ($('.' + name + '-signup input').val() !== "") {
      checkValid(name, answer, context);
    }
  }

  function validor(e, context) {
    e.preventDefault();
    valid("name", "Name already exist, please choose another one", context);
    valid("email", "Email already taken", context);
  }

  function blink() {
    for (i = 0; i < 3 ; i++ ) {
      $('span').fadeTo(500, 0).fadeTo(500, 1.0);
    }
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
        data: $(context).serialize()
      }).done(function() {
        window.location = "/";
      });
    } else {
      blink();
    }
  });

  $('#sign-in').on('submit', function(e){
    e.preventDefault();
    $.ajax({
      type: 'post',
      url: '/session',
      dataType: 'json',
      data: $(this).serialize()
    }).done(function(data){
      console.log(data);
      if (data["status"] === "login") {
        window.location = "/";
      } else if (data["name"] === "exist") {
        $('.password-signin span').text("Wrong password");
        $('.name-signin span').text("");
        blink();
      } else {
        $('.name-signin span').text("Wrong username");
        blink();
      }
    });
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
