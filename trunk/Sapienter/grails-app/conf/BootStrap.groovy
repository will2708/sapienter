import sapienter.Estudio

class BootStrap {

    def init = { servletContext -> 
		1.times { i ->
			 new Estudio(razonSocial: "Sapienter", cuit: "20-30409317-0", domicilioFiscal: "Mozart y Zaraza",).save()
    }
    }
    def destroy = {
    }
}
