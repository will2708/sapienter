import java.util.Date

import sapienter.Calendario
import sapienter.Categoria
import sapienter.Estudio
import sapienter.Juzgado
import sapienter.PersonaFisica
import sapienter.PersonaJuridica
import sapienter.SecRole
import sapienter.SecUser
import sapienter.SecUserSecRole
import sapienter.Subcategoria
import sapienter.TipoDeParte
import sapienter.Usuario

class BootStrap {

	def init = { servletContext ->
		def est = new Estudio(razonSocial: "Sapienter", cuit: "20-30409317-0", domicilioFiscal: "Mozart y Zaraza")
		est.save()
		if (est.hasErrors()) {
			println est.errors
		}
		def perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "",fax: "",telefono:"",codPostal: "",ciudad:"",domicilio:"",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: new Date(),observaciones:"", nombre: "Matias", apellido: "Stani", dni: "31111111", pais: "Argentina", email: "a@a.com", estudio: (Estudio.getAll().get(0)))
		perFis.save()
		if (perFis.hasErrors()) {
			println perFis.errors
		}
		perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "",fax: "",telefono:"",codPostal: "",ciudad:"",domicilio:"",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: new Date(),observaciones:"", nombre: "Nicolas", apellido: "Souto", dni:"30000000", pais: "Argentina", email: "a@a.com", estudio: (Estudio.getAll().get(0)))
		perFis.save()
		if (perFis.hasErrors()) {
			println perFis.errors
		}
		perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "",fax: "",telefono:"",codPostal: "",ciudad:"",domicilio:"",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: new Date(),observaciones:"", nombre: "Romina", apellido: "Perrone", dni: "3000001", pais: "Argentina", email: "a@a.com", estudio: (Estudio.getAll().get(0)))
		perFis.save()
		if (perFis.hasErrors()) {
			println perFis.errors
		}
		def perJur = new PersonaJuridica(razonSocial:"Matute SA", cuit:"4343242", email:"matute@gmail.com",telefonoDeContacto:"5443", auxiliares:"", fax:"", observaciones:"", estudio: (Estudio.getAll().get(0)))
		perJur.save()
		if (perJur.hasErrors()) {
			println perJur.errors
		}
		perJur = new PersonaJuridica(razonSocial:"Nicolote SA", cuit:"4332247", email:"nicolote@gmail.com",telefonoDeContacto:"45", auxiliares:"", fax:"", observaciones:"", estudio: (Estudio.getAll().get(0)))
		perJur.save()
		if (perJur.hasErrors()) {
			println perJur.errors
		}
		perJur = new PersonaJuridica(razonSocial:"Romain SA", cuit:"4122247", email:"romain@gmail.com",telefonoDeContacto:"23", auxiliares:"", fax:"", observaciones:"", estudio: (Estudio.getAll().get(0)))
		perJur.save()
		if (perJur.hasErrors()) {
			println perJur.errors
		}
		def cat = new Categoria(nombreCategoria:"Judicial")
		cat.save()
		if (cat.hasErrors()) {
			println cat.errors
		}
		cat = new Categoria(nombreCategoria:"Extra-Judicial")
		cat.save()
		if (cat.hasErrors()){
				println cat.errors
		}
		
		def juzgado = new Juzgado(estudio: (Estudio.getAll().get(0)),nombreDeJuzgado: "Juzgado 1", numeroDeJuzgado:"1", direccionJuzgado: "AV. DE LOS INMIGRANTES 1950 PISO 4°")
		juzgado.save()
		if (juzgado.hasErrors()){
			println juzgado.errors
		}
		
		juzgado = new Juzgado(estudio: (Estudio.getAll().get(0)),nombreDeJuzgado: "Juzgado 2", numeroDeJuzgado:"2", direccionJuzgado: "TALCAHUANO 490. PISO 5º")
		juzgado.save()
		if (juzgado.hasErrors()){
			println juzgado.errors
		}
		
		juzgado = new Juzgado(estudio: (Estudio.getAll().get(0)),nombreDeJuzgado: "Juzgado 3", numeroDeJuzgado:"3", direccionJuzgado: "TALCAHUANO 550. PISO 6º")
		juzgado.save()
		if (juzgado.hasErrors()){
			println juzgado.errors
		}
		
		juzgado = new Juzgado(estudio: (Estudio.getAll().get(0)),nombreDeJuzgado: "Juzgado 4", numeroDeJuzgado:"4", direccionJuzgado: "LAVALLE 1212. PISO 8º")
		juzgado.save()
		if (juzgado.hasErrors()){
			println juzgado.errors
		}
		
		juzgado = new Juzgado(estudio: (Estudio.getAll().get(0)),nombreDeJuzgado: "Juzgado 5", numeroDeJuzgado:"5", direccionJuzgado: "TALCAHUANO 490. PISO 2º")
		juzgado.save()
		if (juzgado.hasErrors()){
			println juzgado.errors
		}

		juzgado = new Juzgado(estudio: (Estudio.getAll().get(0)),nombreDeJuzgado: "Juzgado 6", numeroDeJuzgado:"6", direccionJuzgado: "AV.DE LOS INMIGRANTES 1950 4º")
		juzgado.save()
		if (juzgado.hasErrors()){
			println juzgado.errors
		}

		juzgado = new Juzgado(estudio: (Estudio.getAll().get(0)),nombreDeJuzgado: "Juzgado 7", numeroDeJuzgado:"7", direccionJuzgado: "TALCAHUANO 490. PISO 6º")
		juzgado.save()
		if (juzgado.hasErrors()){
			println juzgado.errors
		}

				
		def subCat = new Subcategoria(subTipoCategoria:"Postulatoria", categoria:(Categoria.findByNombreCategoria("Judicial")))
        	subCat.save()
			if (subCat.hasErrors()){
				println subCat.errors
			}
		subCat = new Subcategoria(subTipoCategoria:"Probatoria", categoria:(Categoria.findByNombreCategoria("Judicial")))
			subCat.save()
			if (subCat.hasErrors()){
				println subCat.errors
			}
			subCat = new Subcategoria(subTipoCategoria:"Conclusiva", categoria:(Categoria.findByNombreCategoria("Judicial")))
			subCat.save()
			if (subCat.hasErrors()){
				println subCat.errors
			}
			subCat = new Subcategoria(subTipoCategoria:"De Resolución", categoria:(Categoria.findByNombreCategoria("Judicial")))
			subCat.save()
			if (subCat.hasErrors()){
				println subCat.errors
			}
			subCat = new Subcategoria(subTipoCategoria:"Impugnitiva", categoria:(Categoria.findByNombreCategoria("Judicial")))
			subCat.save()
			if (subCat.hasErrors()){
				println subCat.errors
			}
			subCat = new Subcategoria(subTipoCategoria:"Extra-Judicial", categoria:(Categoria.findByNombreCategoria("Extra-Judicial")))
			subCat.save()
			if (subCat.hasErrors()){
				println subCat.errors
			}
			subCat = new Subcategoria(subTipoCategoria:"Mediación", categoria:(Categoria.findByNombreCategoria("Extra-Judicial")))
			subCat.save()
			if (subCat.hasErrors()){
				println subCat.errors
			}
			def tipPar
			tipPar = new TipoDeParte(descripcion:"Contraparte", estudio: (Estudio.getAll().get(0)))
			tipPar.save()
			if (tipPar.hasErrors()){
				println tipPar.errors
			}
			tipPar = new TipoDeParte(descripcion:"Abogado oponente", estudio: (Estudio.getAll().get(0)))
			tipPar.save()
			if (tipPar.hasErrors()){
				println tipPar.errors
			}

			tipPar = new TipoDeParte(descripcion:"Testigo", estudio: (Estudio.getAll().get(0))) 
			tipPar.save()
			if (tipPar.hasErrors()){
				println tipPar.errors
			}

			tipPar = new TipoDeParte(descripcion:"Tercero", estudio: (Estudio.getAll().get(0)))
			tipPar.save()
			if (tipPar.hasErrors()){
				println tipPar.errors
			}

			tipPar = new TipoDeParte(descripcion:"Juez", estudio: (Estudio.getAll().get(0)))
			tipPar.save()
			if (tipPar.hasErrors()){
				println tipPar.errors
			}
			tipPar = new TipoDeParte(descripcion:"Mediador", estudio: (Estudio.getAll().get(0)))
			tipPar.save()
			if (tipPar.hasErrors()){
				println tipPar.errors
			}
			def calendar =new Calendario()
			def userRole = SecRole.findByAuthority('Junior') ?: new SecRole(authority: 'Junior').save(failOnError: true)
			def jrRole = SecRole.findByAuthority('Semi-Senior') ?: new SecRole(authority: 'Semi-Senior').save(failOnError: true)
			def ssrRole = SecRole.findByAuthority('Senior') ?: new SecRole(authority: 'Senior').save(failOnError: true)
			def srRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
			def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
			def adminUser = SecUser.findByUsername('admin') ?: new Usuario(
				username: 'admin',
				password: 'admin',
				nombre: 'Matías',
				apellido: 'Stanislavsky',
				calendario: calendar, 
				estudio: (Estudio.getAll().get(0)),
				comentarios:'Nada en particular',
				telefono:'4354242',
				rol:adminRole,
				enabled: true).save(failOnError: true)
 
		if (!adminUser.authorities.contains(adminRole)) {
			SecUserSecRole.create adminUser, adminRole
		}
	}
	def destroy = {
	}
}


