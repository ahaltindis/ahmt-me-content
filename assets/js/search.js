(function () {
  function onEvent() {
    var filter = search.value.toUpperCase();
    var list = document.getElementById("list");
    var listItems = list.getElementsByTagName("li");
    for (i = 0; i < listItems.length; i++) {
      var item = listItems[i];
      var headers = item.getElementsByTagName("h2");
      if (headers.length < 1) {
        continue;
      }
      var text = headers[0].innerText.toUpperCase();
      if (text.indexOf(filter) > -1) {
        item.style.display = "";
      } else {
        item.style.display = "none";
      }
    }
  }

  var search = document.getElementById("search");
  if (search) {
    search.addEventListener("keyup", onEvent);
  }
})();
