package racetrack

import grails.test.*

class RaceTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

    }
	void testInMiles() {
		def race = new Race(distance:5.0)
		assertEquals 3.107, race.inMiles()
	  }
	void testName(){
		def race2 = new Race(name:"carrera")
		assertEquals "Carrera", race2.name.toString()
	}
}
