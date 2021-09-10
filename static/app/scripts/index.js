
var span = document.getElementsByClassName("close")[0];
var SupportButton = document.getElementById("supportButton")
var SupportContainer = document.getElementById("supportForm")
var span2 = document.getElementsByClassName("closeSupport")[0];


$(".open").on("click", function() {
  $(".popup-overlay, .popup-content").addClass("active");
});

span2.onclick = function() {
	SupportContainer.style.display = "none";
};

// Garment button actions
$(".Inventory").on({'mousedown touchstart': function(){
	$("#InventoryButton").css("background-color", '#8a8a8a')
}
});

$(".Inventory").on({'mouseup touchend': function(){
	$("#InventoryButton").css('background-color', '#8a8a8a')
}
});

$(".Inventory").on({'mousedown touchstart': function(){
	$("#InvTitle").css("color", '#4d4d4d')
}
});
$(".Inventory").on({'mouseup touchend': function(){
	$("#InvTitle").css('color', '#4d4d4d')
}
});

// Employees button actions
$(".Employees").on({'mousedown touchstart': function(){
	$("#EmployeesButton").css("background-color", '#8a8a8a')
}
});
$(".Employees").on({'mouseup touchend': function(){
	$("#EmployeesButton").css('background-color', '#8a8a8a')
}
});

$(".Employees").on({'mousedown touchstart': function(){
	$("#EmpTitle").css("color", '#4d4d4d')
}
});
$(".Employees").on({'mouseup touchend': function(){
	$("#EmpTitle").css('color', '#4d4d4d')
}
});

// Activity button actions
$(".Activity").on({'mousedown touchstart': function(){
	$("#ActivityButton").css("background-color", '#8a8a8a')
}
});
$(".Activity").on({'mouseup touchend': function(){
	$("#ActivityButton").css('background-color', '#8a8a8a')
}
});

$(".Activity").on({'mousedown touchstart': function(){
	$("#ActTitle").css("color", '#4d4d4d')
}
});
$(".Activity").on({'mouseup touchend': function(){
	$("#ActTitle").css('color', '#4d4d4d')
}
});

// Orders button actions
$(".Orders").on({'mousedown touchstart': function(){
	$("#OrdersButton").css("background-color", '#8a8a8a')
}
});
$(".Orders").on({'mouseup touchend': function(){
	$("#OrdersButton").css('background-color', '#8a8a8a')
}
});

$(".Orders").on({'mousedown touchstart': function(){
	$("#OrdTitle").css("color", '#4d4d4d')
}
});
$(".Orders").on({'mouseup touchend': function(){
	$("#OrdTitle").css('color', '#4d4d4d')
}
});

// Cleaning button actions
$(".Cleaning").on({'mousedown touchstart': function(){
	$("#CleaningButton").css("background-color", '#8a8a8a')
}
});
$(".Cleaning").on({'mouseup touchend': function(){
	$("#CleaningButton").css('background-color', '#8a8a8a')
}
});

$(".Cleaning").on({'mousedown touchstart': function(){
	$("#ClTitle").css("color", '#4d4d4d')
}
});
$(".Cleaning").on({'mouseup touchend': function(){
	$("#ClTitle").css('color', '#4d4d4d')
}
});

// Repairs button actions
$(".Repairs").on({'mousedown touchstart': function(){
	$("#RepairsButton").css("background-color", '#8a8a8a')
}
});
$(".RepairsRepairs").on({'mouseup touchend': function(){
	$("#RepairsButton").css('background-color', '#8a8a8a')
}
});

$(".Repairs").on({'mousedown touchstart': function(){
	$("#RepTitle").css("color", '#4d4d4d')
}
});
$(".Repairs").on({'mouseup touchend': function(){
	$("#RepTitle").css('color', '#4d4d4d')
}
});

// Reports button actions
$(".Reports").on({'mousedown touchstart': function(){
	$("#ReportsButton").css("background-color", '#8a8a8a')
}
});
$(".Reports").on({'mouseup touchend': function(){
	$("#ReportsButton").css('background-color', '#8a8a8a')
}
});

$(".Reports").on({'mousedown touchstart': function(){
	$("#ReportTitle").css("color", '#4d4d4d')
}
});
$(".Reports").on({'mouseup touchend': function(){
	$("#ReportTitle").css('color', '#4d4d4d')
}
});

// Settings button actions
$(".Settings").on({'mousedown touchstart': function(){
	$("#SettingsButton").css("background-color", '#8a8a8a')
}
});
$(".Settings").on({'mouseup touchend': function(){
	$("#SettingsButton").css('background-color', '#8a8a8a')
}
});

$(".Settings").on({'mousedown touchstart': function(){
	$("#SetTitle").css("color", '#4d4d4d')
}
});
$(".Settings").on({'mouseup touchend': function(){
	$("#SetTitle").css('color', '#4d4d4d')
}
});
