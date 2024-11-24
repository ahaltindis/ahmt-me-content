function changeGalleryImage(source, galleryId) {
  // set image and label
  document.getElementById(galleryId + "_image").src = source.src;
  document.getElementById(galleryId + "_caption").innerHTML = source.alt;

  // clear all 'selected' class from previews
  document.getElementById(galleryId + "_previews").querySelectorAll("img").forEach(img => {
    img.classList.remove("gallery-image-selected");
  });

  // add 'selected' class to current source
  source.classList.add("gallery-image-selected");
}
