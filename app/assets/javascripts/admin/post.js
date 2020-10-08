$(function() {
  $(".change-slug").on("click", function(){
    var valInputTittle = $(".input-title").val();
    if(valInputTittle != ""){
      var valSlug = valInputTittle.trim().toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/đ/g, "d").replace(/Đ/g, "D").replace(/\s/g, "-");
      // var valSlug = valInputTittle.trim().toLowerCase().replace(/[^a-zA-Z0-9 -]/, "").replace(/\s/g, "-");
      $(".input-slug").val(valSlug);
    }
  });

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
