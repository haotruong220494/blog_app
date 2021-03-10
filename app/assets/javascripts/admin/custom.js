$(document).ready(function($) {
  $(".img-logo-unauthen").on("click", function(){
    $("#login-modal").modal("show");
  });

  $(".custom-file-input").on("change", function () {
    var t = $(this).val().split("\\").pop();
    $(this).siblings(".custom-file-label").addClass("selected").html(t);
  });
});
