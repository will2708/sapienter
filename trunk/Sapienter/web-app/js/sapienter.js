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

	var $ini = $("#fechaDeCreacion");	
	if ($("#diasDeValidez").val() != '') {
		alert($("#diasDeValidez").val());

		alert($("#fechaDeCreacion").val());
	}
}

function updateSubcategorias(e) { 
    var subTipoCategorias = eval("(" + e.responseText + ")")
    if (subTipoCategorias) { 
    	var rselect = document.getElementById('subcategoria')

    	// Clear all previous options
    	var l = rselect.length

    	while (l > 0) { 
    		l--; 
    		rselect.remove(l); 
    	}

    	// Rebuild the select
    	for (var i=0; i < subTipoCategorias.length; i++) { 
    		var subcategoria = subTipoCategorias[i];
    		var opt = document.createElement('option'); 
    		opt.text = subcategoria.subTipoCategoria;
    		opt.value = subcategoria.id;
    		try { 
    			rselect.add(opt, null); // standard compliant; doesn't work in IE
    		}
    		catch(ex) { 
    			rselect.add(opt); // IE only
    		}
    	}
    }
}


// This is called when the page loads to initialize city
var zselect = document.getElementById('categoria.nombreCategoria');
var zopt = zselect.options[zselect.selectedIndex];
${remoteFunction(controller:"categoria", action:"ajaxGetSubcategorias", params:"'id=' + zopt.value", onComplete:"updateSubcategorias(e)")}
