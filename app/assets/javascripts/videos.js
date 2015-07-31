  var video = document.getElementById("style_image");

  $('#style_image').hover(function toggleControls() {
    if (video.hasAttribute("controls")) {
        video.removeAttribute("controls")
    } else {
        video.setAttribute("controls", "controls")
    }
})