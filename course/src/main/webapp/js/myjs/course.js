

function previewVideo(target){
    var resource = $(target).parent().attr("data-resource");
    $(".header-video").attr('src', resource)[0].play();

}

function downloadVideo(target){
    var resource = $(target).parent().attr("data-resource");
    open("/download/?path=" + resource);
}

var ue;
$(function(){
    ue = UE.getEditor("ue-editor");
    ue.ready(function () {
        ue.setDisabled();
    });
})