function flipCard(obj) {
  var children = obj.childNodes;
  for (var i=0,len=children.length;i<len;i++) {
    if (children[i].className == "flash_card_hide") {
      children[i].className = "flash_card_show";
    } else {
      children[i].className = "flash_card_hide";
    }
  }
}

