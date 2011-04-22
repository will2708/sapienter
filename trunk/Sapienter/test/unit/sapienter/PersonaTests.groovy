package sapienter

import grails.test.*

class PersonaTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testPersona() {
		def persona = new Persona(nombre:"Matias",apellido:"Toth")
		assertEquals "Matias", persona.nombre.toString()
		assertEquals "Toth", persona.apellido.toString()
    }
}
