
document.getElementById("employeeInfo").click();

function openTab(evt, tabName) {
  var i, empInfo, tablinks;
  empInfo = document.getElementsByClassName("empInfo");
  for (i = 0; i < empInfo.length; i++) {
    empInfo[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < empInfo.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " active";
}