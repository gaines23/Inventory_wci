
//Tabs linked to #garmInfo to go between Details and Orders pages

document.getElementById("garmInfo").click();

function openTab(evt, tabName) {
  var i, invForm, tablinks;
  invForm = document.getElementsByClassName("invForm");
  for (i = 0; i < invForm.length; i++) {
    invForm[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < invForm.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " active";
}


//Tabs linked Orders tables
document.getElementById("orderGarm").click();

function openOrdTab(evt, tabName) {
  var i, garmentOrders, ordtablinks;
  garmentOrders = document.getElementsByClassName("garmentOrders");
  for (i = 0; i < garmentOrders.length; i++) {
    garmentOrders[i].style.display = "none";
  }
  ordtablinks = document.getElementsByClassName("ordtablink");
  for (i = 0; i < garmentOrders.length; i++) {
    ordtablinks[i].className = ordtablinks[i].className.replace(" active", "");
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " active";
}



