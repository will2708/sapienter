function estadoCivilChanged() { 
	
	if($("#estadoCivil").val() == 'Viudo') {		
		
		$('#conyuge').attr("disabled","disabled");
		$('#conyuge').css("background-color","#EEEEEE");
		$('#conyuge').val('');
	}
	else {
		$('#conyuge').removeAttr("disabled");
		$('#conyuge').css("background-color","white");
	}
}
