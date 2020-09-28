$(function () {
    var allBoxs = $(":checkbox");
        allBoxs.click(function () {
        allBoxs.removeAttr("checked");
        $(this).attr("checked", "checked");
    });
    /*$(":button").click(function () {
        alert($(":checkbox:checked").val());
    });*/
});