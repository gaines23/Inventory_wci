
function sortTable(e) {
  var th = e.target;
  if (th.nodeName.toLowerCase() !== 'th') return true;

  var n = 0; while (th.parentNode.cells[n] != th) ++n;
  var order = th.order || 1; th.order = -order;
  var t = this.querySelector('tbody');

  t.innerHTML = Object.keys(t.rows)
    .filter(k => !isNaN(k))
    .map(k => t.rows[k])
    .sort((a, b) => order * (typed(a) > typed(b) ? 1 : -1))
    .map(r => r.outerHTML)
    .join('');

  function typed(tr) {
    var s = tr.cells[n].innerText;
    var d = Date.parse(s.replace(/^(\d{1,2})st|th/, '$1'))
    return isNaN(d) ? s.toLowerCase() : d;
  }


}
document.querySelector('#emptable')
  .addEventListener('click', sortTable, false);  



/* Search functions for each category
    listed on the page
*/
function IDSearch() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("IdInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("emptable");
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function FirstSearch() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("FirstNameInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("emptable");
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function LastSearch() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("LastNameInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("emptable");
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[2];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function DeptSearch() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("DeptInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("emptable");
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[3];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function JobSearch() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("JobInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("emptable");
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[4];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}




