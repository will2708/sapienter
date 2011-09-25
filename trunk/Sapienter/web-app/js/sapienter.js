function estadoCivilChanged() {

	if ($("#estadoCivil").val() == 'Viudo') {
		$('#conyuge').attr("disabled", "disabled");
		$('#conyuge').css("background-color", "#EEEEEE");
		$('#conyuge').val('');
	} else {
		$('#conyuge').removeAttr("disabled");
		$('#conyuge').css("background-color", "white");
	}
}

function categoriaChanged() {

	// Declaro las múltiples opciones en caso de que el proceso sea Judicial
	var newOptions = {
		"Postulatoria" : "Postulatoria",
		"Probatoria" : "Probatoria",
		"Conclusiva" : "Conclusiva",
		"De Resolucion" : "De resolución",
		"Impugnitiva" : "Impugnitiva",
	};

	var $el = $("#etapaProcesal");

	// Declaro variable en caso de que sea judicial
	// Linkeo el combo-box con una variable

	if ($("#categoria").val() == 'Extra-Judicial') {
		var option = $('<option></option>').attr("Extra-Judicial",
				"Extra-Judicial").text("Extra-Judicial");
		$el.empty().append(option);
	} else {
		$el.empty(); // saca las opciones anteriores
		$.each(newOptions, function(key, value) {
			$el.append($("<option></option>").attr("value", value).text(key));
		});

	}
}
function diasChanged() {
	alert('hola');
}
