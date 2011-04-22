package racetrack

import java.awt.event.ItemEvent;

import org.hibernate.loader.custom.Return;

class Race{
	static mapping = {
		sort "startDate"
	}
	String name
	Date startDate
	String city
	String State
	BigDecimal distance
	BigDecimal cost
	Integer maxRunners = 100000
	
    static constraints = {
		name(blank:false,maxsize:50)
		startDate(validator: {return (it > new Date())})
		city()
		state(inList:["BA", "SF", "CO", "SL"])
		distance(min:0.0)
		cost(min:0.0, max:100.0)
		maxRunners(min:0, max:100000)
		
    }
	BigDecimal inMiles(){
		Return
		 distance * 0.6214
	}
	BigDecimal inMeters(){
		Return
		distance * 1000
	}
	BigDecimal inMm(){
		Return
		 distance *1000000
	}
}
