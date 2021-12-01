
var build = $("#buildingSelect");
var batt = $("#batterySelect");
var col = $("#columnSelect");
var elev = $("#liftSelect");
build.hide()
batt.hide()
col.hide()
elev.hide()

$("#building").prop("disabled", true);
$("#customer").change(function(){
    var customer = $(this).val(); //think this is where it's messing up?
    if(customer == ""){
    console.log("This is the Customer" + customer);
        $("#building").prop("disabled", true);
		build.hide()
		batt.hide()
		col.hide()
		elev.hide()
		$("#building").empty();
		$("#battery").empty();
		$("#column").empty();
		$("#elevator").empty();

    }else{
        $("#building").prop("disabled", false);
		build.show()
		batt.hide()
		col.hide()
		elev.hide()
		$("#battery").empty();
		$("#column").empty();
		$("#elevator").empty();
    }
	if(customer !== ""){
    $.ajax({
	    url: "/building_select/" + customer,
	    method: "GET",  
	    dataType: "json",
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var tasks = response;
	      	$("#building").empty();
            $("#building").append('<option value="">None</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#building").append('<option value="' + tasks[i]["id"] + '">' + tasks[i]["id"] + '</option>');
                  console.log(tasks.length);
	      		}
	    	}
  		});
	}
});
$("#battery").prop("disabled", true);
$("#building").change(function(){
    var building = $(this).val();
    if(building == ''){
        $("#battery").prop("disabled", true);
		batt.hide();
		col.hide();
		elev.hide();
		$("#battery").empty();
		$("#column").empty();
		$("#elevator").empty();
    }else{
        $("#battery").prop("disabled", false);
		batt.show();
		col.hide();
		elev.hide();
		$("#column").empty();
		$("#elevator").empty();
    }
	if(building !== ""){
    $.ajax({
	    url: "/battery_select/" + building,
	    method: "GET",  
	    dataType: "json",
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var tasks = response;
	      	$("#battery").empty();
            $("#battery").append('<option value="">None</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#battery").append('<option value="' + tasks[i]["id"] + '">' + tasks[i]["id"] + '</option>');
                  console.log(tasks.length);
	      		}
	    	}
  		});
	}
});
$("#column").prop("disabled", true);
$("#battery").change(function(){
    var column = $(this).val();
    if(column == ''){
        $("#column").prop("disabled", true);
		col.hide();
		elev.hide();
		$("#column").empty();
		$("#elevator").empty();
    }else{
        $("#column").prop("disabled", false);
		col.show();
		elev.hide();
		$("#elevator").empty();
    }
	if(column !== ""){
    $.ajax({
	    url: "/column_select/" + column,
	    method: "GET",  
	    dataType: "json",
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var tasks = response;
	      	$("#column").empty();
            $("#column").append('<option value="">None</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#column").append('<option value="' + tasks[i]["id"] + '">' + tasks[i]["id"] + '</option>');
                  console.log(tasks.length);
	      		}
	    	}
  		});
	}
});
$("#elevator").prop("disabled", true);
$("#column").change(function(){
    var elevator = $(this).val();
    if(elevator == ''){
        $("#elevator").prop("disabled", true);
		elev.hide();
		$("#elevator").empty();
    }else{
        $("#elevator").prop("disabled", false);
		elev.show();
    }
	if(elevator !== "None"){
    $.ajax({
	    url: "/elevator_select/" + elevator,
	    method: "GET",  
	    dataType: "json",
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var tasks = response;
	      	$("#elevator").empty();
            $("#elevator").append('<option value="">None</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#elevator").append('<option value="' + tasks[i]["id"] + '">' + tasks[i]["id"] + '</option>');
                  console.log(tasks.length);
				  
	      		}
	    	}
  		});
	}
});

$("textarea").each(function () {
	this.setAttribute("style", "height:" + (this.scrollHeight) + "px;overflow-y:hidden;");
  }).on("input", function () {
	this.style.height = "auto";
	this.style.height = (this.scrollHeight) + "px";
  });