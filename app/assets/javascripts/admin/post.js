$(function() {
  $(".change-slug").on("click", function(){
    const valInputTittle = $(".input-title").val();
    if(valInputTittle != ""){
      const valSlug = valInputTittle.trim().toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/đ/g, "d").replace(/Đ/g, "D").replace(/\s/g, "-");
      // var valSlug = valInputTittle.trim().toLowerCase().replace(/[^a-zA-Z0-9 -]/, "").replace(/\s/g, "-");
      $(".input-slug").val(valSlug);
    }
  });
});
