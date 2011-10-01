function diasChanged() {
	
	if ( $("#diasDeValidez").val() != '') {
		

		var fecha = $( "#fechaDeCreacion" ).datepicker( "getDate" );
		if (fecha != null){
			var dias = $("#diasDeValidez").val();
			
			dias = dias * -1;
			fecha.setDate( fecha.getDate() - dias );
			
			$( "#fechaDeVencimiento" ).datepicker( "setDate" , fecha);
		}
	}
}

$(function() {
	
	$( "#fechaDeCreacion" ).datepicker();
	$( "#fechaDeVencimiento" ).datepicker();
	
	$( "#fechaDeCreacion" ).datepicker( "option", "dateFormat", 'dd-mm-yy' );;
	$( "#fechaDeVencimiento" ).datepicker( "option", "dateFormat", 'dd-mm-yy' );;
});