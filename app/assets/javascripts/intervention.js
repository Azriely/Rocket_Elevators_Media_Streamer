Document.ready
var build = $("#buildingSelect");
var batt = $("#batterySelect");
var col = $("#columnSelect");
var elev = $("#liftSelect");
build.hide()
batt.hide()
col.hide()
elev.hide()
$("#intervention_Building").prop("disabled", true);
$("#intervention_Client").change(function(){
    var customer = $(this).val(); //think this is where it's messing up?
    if(customer == 'Customer'){
        $("#intervention_Building").prop("disabled", true);
		build.hide()
		batt.hide()
		col.hide()
		elev.hide()
		$("#intervention_Building").empty();
		$("#intervention_Battery").empty();
		$("#intervention_Column").empty();
		$("#intervention_Lift").empty();

    }else{
        $("#intervention_Building").prop("disabled", false);
		build.show()
		batt.hide()
		col.hide()
		elev.hide()
		$("#intervention_Battery").empty();
		$("#intervention_Column").empty();
		$("#intervention_Lift").empty();
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
	      	$("#intervention_Building").empty();
            $("#intervention_Building").append('<option value="">None</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#intervention_Building").append('<option value="' + tasks[i]["id"] + '">' + tasks[i]["id"] + '</option>');
                  console.log(tasks.length);
	      		}
	    	}
  		});
	}
});
$("#intervention_Battery").prop("disabled", true);
$("#intervention_Building").change(function(){
    var building = $(this).val();
    if(building == ''){
        $("#intervention_Battery").prop("disabled", true);
		batt.hide();
		col.hide();
		elev.hide();
		$("#intervention_Battery").empty();
		$("#intervention_Column").empty();
		$("#intervention_Lift").empty();
    }else{
        $("#intervention_Battery").prop("disabled", false);
		batt.show();
		col.hide();
		elev.hide();
		$("#intervention_Column").empty();
		$("#intervention_Lift").empty();
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
	      	$("#intervention_Battery").empty();
            $("#intervention_Battery").append('<option value="">None</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#intervention_Battery").append('<option value="' + tasks[i]["id"] + '">' + tasks[i]["id"] + '</option>');
                  console.log(tasks.length);
	      		}
	    	}
  		});
	}
});
$("#intervention_Column").prop("disabled", true);
$("#intervention_Battery").change(function(){
    var column = $(this).val();
    if(column == ''){
        $("#intervention_Column").prop("disabled", true);
		col.hide();
		elev.hide();
		$("#intervention_Column").empty();
		$("#intervention_Lift").empty();
    }else{
        $("#intervention_Column").prop("disabled", false);
		col.show();
		elev.hide();
		$("#intervention_Lift").empty();
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
	      	$("#intervention_Column").empty();
            $("#intervention_Column").append('<option value="">None</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#intervention_Column").append('<option value="' + tasks[i]["id"] + '">' + tasks[i]["id"] + '</option>');
                  console.log(tasks.length);
	      		}
	    	}
  		});
	}
});
$("#intervention_Lift").prop("disabled", true);
$("#intervention_Column").change(function(){
    var elevator = $(this).val();
    if(elevator == ''){
        $("#intervention_Lift").prop("disabled", true);
		elev.hide();
		$("#intervention_Lift").empty();
    }else{
        $("#intervention_Lift").prop("disabled", false);
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
	      	$("#intervention_Lift").empty();
            $("#intervention_Lift").append('<option value="">None</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#intervention_Lift").append('<option value="' + tasks[i]["id"] + '">' + tasks[i]["id"] + '</option>');
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