$(document).ready(function() {

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
        $('#' + field + '-input span').text(errorMsg);
      } else {
        $('#' + field + '-input span').text("");        
      }
    });
  }

  // function validor(e, context) {
  //   e.preventDefault();
  //   console.log("----in the click event----");
  //   checkValid("name", "Name already exist, please choose another one", context);
  //   checkValid("email", "Email already taken", context);
  // }

  $('#sign-up').on("click", function (e) {
    var context = this;
    e.preventDefault();
    console.log("----in the click event----");
    checkValid("name", "Name already exist, please choose another one", context);
    checkValid("email", "Email already taken", context);
  });

  $('#sign-up').on("change", function (e) {
    var context = this;
    e.preventDefault();
    console.log("----in the click event----");
    checkValid("name", "Name already exist, please choose another one", context);
    checkValid("email", "Email already taken", context);
  });

});
