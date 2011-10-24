$(document).ready(function() {
	$('#cal').fullCalendar({
		header: { left: "month, agendaWeek, agendaDay", center: "title", right: "prev, today, next" },
		columnFormat: { week: 'ddd d/M' },
		timeFormat: 'HH:mm{ - HH:mm}',
		buttonText: { today:    'Hoy',
					  month:    'Mes',
					  week:     'Semana',
					  day:      'Dia'
					  },
		dayNames: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
		dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
		monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'Octubre', 'Noviembre', 'Deciembre'],
		allDaySlot: false,
		minTime: '7:00am',
		maxTime: '8:00pm',
		events: 'events',			  
		
	    dayClick: function(date, allDay, jsEvent, view) {
	    	var u = "/Sapienter/tarea/crearDesdeCalendario?calendario=1&fecha=" + date ; 
	    	window.location = u;
	    }
	})
});