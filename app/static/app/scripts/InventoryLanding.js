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
document.querySelector('#invtable')
  .addEventListener('click', sortTable, false);  



/* Search functions for each category
    listed on the page
*/
function IDSearch() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("IdInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("invtable");
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

function RFIDSearch() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("RFIDInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("invtable");
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

function JobSearch() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("JobInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("invtable");
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

function EmpSearch() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("EmpInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("invtable");
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[6];
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

function AltSearch() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("AltInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("invtable");
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[7];
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
