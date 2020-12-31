$(function() {
  $(".change-slug").on("click", function () {
    var t = $(".input-title").val();
    if ("" != t) {
      var e = t
        .trim()
        .toLowerCase()
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "")
        .replace(/đ/g, "d")
        .replace(/Đ/g, "D")
        .replace(/\s/g, "-");
      $(".input-slug").val(
        e + "-" +
        (function (a) {
          charSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
          for (var t = "", e = 0; e < a; e++) {
            var l = Math.floor(Math.random() * charSet.length);
            t += charSet.substring(l, l + 1);
          }
          return t;
        })(5)
      );
    }
  })


  // $("#load-tag")[0].selectize.clear();
  // $("#load-tag")[0].selectize.onSearchChange($(this).val());
  $("#load-tag").selectize(optionSelectTag());

  function optionSelectTag() {
    return {
      preload: true,
      valueField: "id",
      labelField: "name",
      searchField: "name",
      persist: true,
      load: function(query, callback) {
        $.ajax({
          url: "/admin/posts/load_tags",
          type: "GET",
          error: function() {
            callback();
          },
          success: function(res) {
            console.log(res)
            setTimeout(function(){
              callback(res.tags);
            }, 300);
          }
        });
      }
    };
  }
});
