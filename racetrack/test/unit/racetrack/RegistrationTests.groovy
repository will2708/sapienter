package racetrack

import grails.test.*

class RegistrationTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testName() {
	def registration = new Registration(name:"Hola")
	assertEquals "Hola", registration.name.toString()
    }
}
