import java.util.Date

import sapienter.Calendario
import sapienter.Categoria
import sapienter.CorreoElectronico
import sapienter.Estudio
import sapienter.Juzgado
import sapienter.PersonaFisica
import sapienter.PersonaJuridica
import sapienter.Proceso
import sapienter.SecRole
import sapienter.SecUserSecRole
import sapienter.Subcategoria
import sapienter.TipoDeParte
import sapienter.Usuario

class BootStrap {

	def init = { servletContext ->
		
		/* Categorias */
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
		
		/* Sub Categorias */
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
		
		/* Estudio */
		def est = new Estudio(razonSocial: "Sapienter", cuit: "20-30409317-0", domicilioFiscal: "Av. Cordoba 600")
		est.save()
		if (est.hasErrors()) {
			println est.errors
		}
		/* Modelos de documentos */
		/* TODO cargar */
		
		/* Enlace Util */
		/* TODO cargar */
		
		/* Jurisprudencia */
		/* TODO cargar */
		
		/* Juzgados */
		def juzgado = new Juzgado(estudio: (Estudio.getAll().get(0)), nombreDeJuzgado: "Juzgado 1", numeroDeJuzgado:"1", direccionJuzgado: "AV. DE LOS INMIGRANTES 1950 PISO 4°")
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

		/* Tipo de parte */
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
	
		/* Personas Fisicas - Sin procesos */
		Date fecha = new Date ();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(fecha)
		calendar.add(Calendar.YEAR, -30)
		fecha = calendar.getTime()
		
		def perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "Contador",fax: "",telefono:"4107-7326",codPostal: "1003",ciudad:"CABA",domicilio:"San Martin 344",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: fecha, observaciones:"", nombre: "Gabriel", apellido: "Bonsoir", dni: "26624132", pais: "Argentina", email: "gbonsoir@sapienter.org", estudio: (Estudio.getAll().get(0)))
		perFis.save()
		if (perFis.hasErrors()) {
			println perFis.errors
		}
		perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "",fax: "",telefono:"15462-8989",codPostal: "",ciudad:"",domicilio:"",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: fecha, observaciones:"", nombre: "Nicolas", apellido: "Souto", dni:"32456777", pais: "Argentina", email: "nsouto@sapienter.org", estudio: (Estudio.getAll().get(0)))
		perFis.save()
		if (perFis.hasErrors()) {
			println perFis.errors
		}
		perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "Analista de sistemas",fax: "",telefono:"155376-9878",codPostal: "",ciudad:"",domicilio:"",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: fecha, observaciones:"", nombre: "Romina", apellido: "Perrone", dni: "32677644", pais: "Argentina", email: "rperrone@sapienter.org", estudio: (Estudio.getAll().get(0)))
		perFis.save()
		if (perFis.hasErrors()) {
			println perFis.errors
		}
		perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "Diseñadora Gráfica",fax: "",telefono:"4855-2424",codPostal: "1224",ciudad:"CABA",domicilio:"Sarmiento 3208 PB 2",conyuge:"Germán Camardella",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: fecha ,observaciones:"", nombre: "Mailen", apellido: "Brandao", dni: "32675888", pais: "Argentina", email: "mailen.brandaor@gmail.com", estudio: (Estudio.getAll().get(0)))
		perFis.save()
		if (perFis.hasErrors()) {
			println perFis.errors
		}
		perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "Arquitecta",fax: "",telefono:"4958-2934",codPostal: "1224",ciudad:"CABA",domicilio:"Agrelo 4050",conyuge:"",madre: "", padre: "",estadoCivil: "Casado", fechaNacimiento: fecha ,observaciones:"", nombre: "Manuela", apellido: "Bresso", dni: "14676888", pais: "Argentina", email: "manuela_bresso@yahoo.com.ar", estudio: (Estudio.getAll().get(0)))
		perFis.save()
		if (perFis.hasErrors()) {
			println perFis.errors
		}
		perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "Docente",fax: "",telefono:"4637-7267",codPostal: "1437",ciudad:"CABA",domicilio:"Varela 887 1°D",conyuge:"",madre: "", padre: "",estadoCivil: "Casado", fechaNacimiento: fecha ,observaciones:"", nombre: "Alejandro", apellido: "Sanchez", dni: "11632765", pais: "Argentina", email: "alejandro_sanchez@hotmail.com", estudio: (Estudio.getAll().get(0)))
		perFis.save()
		if (perFis.hasErrors()) {
			println perFis.errors
		}
		perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "Ingeniero",fax: "",telefono:"4456-5656",codPostal: "1433",ciudad:"CABA",domicilio:"Matheu 564 4°A",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: fecha ,observaciones:"", nombre: "Fabian", apellido: "Ippolito", dni: "28712111", pais: "Argentina", email: "fabian.ippolito@gmail.com", estudio: (Estudio.getAll().get(0)))
		perFis.save()
		if (perFis.hasErrors()) {
			println perFis.errors
		}
		perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "Fonaudiologa",fax: "",telefono:"4456-8798",codPostal: "1433",ciudad:"CABA",domicilio:"Alberti 1632",conyuge:"",madre: "", padre: "",estadoCivil: "Soltero", fechaNacimiento: fecha ,observaciones:"", nombre: "Natalia", apellido: "Ippolito", dni: "32564878", pais: "Argentina", email: "nataliaippolito@gmail.com", estudio: (Estudio.getAll().get(0)))
		perFis.save()
		if (perFis.hasErrors()) {
			println perFis.errors
		}
		perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "Docente",fax: "",telefono:"4982-4444",codPostal: "1424",ciudad:"CABA",domicilio:"Rosario 78 6°B",conyuge:"",madre: "", padre: "",estadoCivil: "Divorciado", fechaNacimiento: fecha ,observaciones:"", nombre: "Susana", apellido: "Muñoz", dni: "11632444", pais: "Argentina", email: "susana_munioz@hotmail.com", estudio: (Estudio.getAll().get(0)))
		perFis.save()
		if (perFis.hasErrors()) {
			println perFis.errors
		}
		perFis = new PersonaFisica(auxiliar:"",informacionTributaria:"",profesion: "Carpintero",fax: "",telefono:"4432-8877",codPostal: "1423",ciudad:"CABA",domicilio:"Pedernera 897",conyuge:"",madre: "", padre: "",estadoCivil: "Viudo", fechaNacimiento: fecha ,observaciones:"", nombre: "Marcelo", apellido: "Colagiovani", dni: "23787898", pais: "Argentina", email: "marcelo_cola@hotmail.com", estudio: (Estudio.getAll().get(0)))
		perFis.save()
		if (perFis.hasErrors()) {
			println perFis.errors
		}
		/* Personas Juridicas */
		def perJur = new PersonaJuridica(razonSocial:"Matute SA", cuit:"27-564777-3", email:"matute@gmail.com",telefonoDeContacto:"5443-9898", auxiliares:"", fax:"", observaciones:"", estudio: (Estudio.getAll().get(0)))
		perJur.save()
		if (perJur.hasErrors()) {
			println perJur.errors
		}
		perJur = new PersonaJuridica(razonSocial:"Nicolote SA", cuit:"27-654888-5", email:"nicolote@gmail.com",telefonoDeContacto:"4566-8787", auxiliares:"", fax:"", observaciones:"", estudio: (Estudio.getAll().get(0)))
		perJur.save()
		if (perJur.hasErrors()) {
			println perJur.errors
		}
		perJur = new PersonaJuridica(razonSocial:"Romain SA", cuit:"27-876654-8", email:"romain@gmail.com",telefonoDeContacto:"4562-8983", auxiliares:"", fax:"", observaciones:"", estudio: (Estudio.getAll().get(0)))
		perJur.save()
		if (perJur.hasErrors()) {
			println perJur.errors
		}
		perJur = new PersonaJuridica(razonSocial:"Hexastar SA", cuit:"27-999788-9", email:"info@hexastar.com",telefonoDeContacto:"4308-9999", auxiliares:"", fax:"", observaciones:"Contactar a Fernando Salgado", estudio: (Estudio.getAll().get(0)))
		perJur.save()
		if (perJur.hasErrors()) {
			println perJur.errors
		}
		perJur = new PersonaJuridica(razonSocial:"Capgemini SA", cuit:"27-334765-9", email:"legales@capgemini.com",telefonoDeContacto:"4785-8093", auxiliares:"", fax:"4785-8090", observaciones:"", estudio: (Estudio.getAll().get(0)))
		perJur.save()
		if (perJur.hasErrors()) {
			println perJur.errors
		}
		perJur = new PersonaJuridica(razonSocial:"Kimberly Clark", cuit:"27-324555-6", email:"luciana.castanio@kimberly-clark.com",telefonoDeContacto:"4308-9999", auxiliares:"", fax:"", observaciones:"", estudio: (Estudio.getAll().get(0)))
		perJur.save()
		if (perJur.hasErrors()) {
			println perJur.errors
		}
		perJur = new PersonaJuridica(razonSocial:"DL Consultores SRL", cuit:"27-234111-6", email:"matias-trumb@dlconsultores.com.ar",telefonoDeContacto:"4983-4545", auxiliares:"", fax:"4983-4555", observaciones:"", estudio: (Estudio.getAll().get(0)))
		perJur.save()
		if (perJur.hasErrors()) {
			println perJur.errors
		}
		perJur = new PersonaJuridica(razonSocial:"Captton", cuit:"27-765999-3", email:"matias.micenm@captton.com",telefonoDeContacto:"4922-6767", auxiliares:"", fax:"", observaciones:"", estudio: (Estudio.getAll().get(0)))
		perJur.save()
		if (perJur.hasErrors()) {
			println perJur.errors
		}
		perJur = new PersonaJuridica(razonSocial:"Farmacity", cuit:"27-876987-1", email:"farmacity@farmacity.com",telefonoDeContacto:"4896-5556", auxiliares:"", fax:"", observaciones:"Contactar a Martín Melidoni", estudio: (Estudio.getAll().get(0)))
		perJur.save()
		if (perJur.hasErrors()) {
			println perJur.errors
		}
		perJur = new PersonaJuridica(razonSocial:"Femsa SA", cuit:"27-324556-2", email:"legales@coca-cola.com.ar",telefonoDeContacto:"4922-6767", auxiliares:"", fax:"", observaciones:"", estudio: (Estudio.getAll().get(0)))
		if (perJur.hasErrors()) {
			println perJur.errors
		}
		/*Usuarios*/
		createUsersAndGroups()
		
		/*Procesos*/
		def proceso = new Proceso(caratula: "DA CORTE, Carlos Marcelo" , categoria: cat , descripcion: "s/recurso extraordinario", estado: 'Cerrado', etapaProcesal: 'De Resolución' , juzgado:(Juzgado.getAll().get(2)) , numeroDeProcesoEnJuzgado:"45469" , observaciones: "Fallo: Se rechaza el recurso extraordinario impuesto" , responsable: (Usuario.getAll().get(1)), subCategoría: subCat, ultimoModificador: (Usuario.getAll().get(1)) , estudio: (Estudio.getAll().get(0)), persona: (PersonaFisica.getAll().get(3)) )
		proceso.save()
		if (proceso.hasErrors()) {
			println proceso.errors
		}
		proceso = new Proceso(caratula: "Caña, Gabriela Cecilia" , categoria: (Categoria.getAll().get(0)) , descripcion: "s/sobreseimiento", estado: 'Abierto a pruebas', etapaProcesal: 'Probatoria' , juzgado:(Juzgado.getAll().get(2)) , numeroDeProcesoEnJuzgado:"45894" , observaciones: "Testigo citado para el 12/12" , responsable: (Usuario.getAll().get(2)), Subcategoría: (Subcategoria.getAll().get(3)), ultimoModificador:(Usuario.getAll().get(2)), estudio: (Estudio.getAll().get(0)), persona: (PersonaFisica.getAll().get(3)) )
		proceso.save()
		if (proceso.hasErrors()) {
			println proceso.errors
		}
		proceso = new Proceso(caratula: "Moneta, Raúl J. P." , categoria: (Categoria.getAll().get(1)) , descripcion: "s/ procesamiento y embargo", estado: 'En tratamiento', etapaProcesal: 'Postulatoria' , juzgado:(Juzgado.getAll().get(6)) , numeroDeProcesoEnJuzgado:"30748" , observaciones: "", responsable: (Usuario.getAll().get(4)), subCategoría: (Subcategoria.getAll().get(5)), ultimoModificador:(Usuario.getAll().get(4)) , estudio: (Estudio.getAll().get(0)), persona: (PersonaJuridica.getAll().get(6)) )
		proceso.save()
		if (proceso.hasErrors()) {
			println proceso.errors
		}
		proceso = new Proceso(caratula: "Barbarosch, Alfredo" , categoria: (Categoria.getAll().get(1)) , descripcion: "s/ recurso de queja por retardo de justicia", estado: 'En tratamiento', etapaProcesal: 'Extra-Judicial' , juzgado:(Juzgado.getAll().get(4)) , numeroDeProcesoEnJuzgado:"31165" , observaciones:"" , responsable: (Usuario.getAll().get(5)), subCategoría: (Subcategoria.getAll().get(6)), ultimoModificador:(Usuario.getAll().get(5)) , estudio: (Estudio.getAll().get(0)), persona: (PersonaJuridica.getAll().get(5)) )
		proceso.save()
		if (proceso.hasErrors()) {
			println proceso.errors
		}
		proceso = new Proceso(caratula: "Daysi Felicita y Chirino Navarro, José Antonio" , categoria: (Categoria.getAll().get(0)) , descripcion: "s/procesamiento y prisión preventiva", estado: 'Demanda en preparación', etapaProcesal: 'Impugnativa' , juzgado:(Juzgado.getAll().get(2)) , numeroDeProcesoEnJuzgado:"46286" , observaciones: "Robo a mano armada" , responsable: (Usuario.getAll().get(4)), subCategoría: (Subcategoria.getAll().get(2)), ultimoModificador:(Usuario.getAll().get(5)) , estudio: (Estudio.getAll().get(0)), persona: (PersonaFisica.getAll().get(7)) )
		proceso.save()
		if (proceso.hasErrors()) {
			println proceso.errors
		}
		proceso = new Proceso(caratula: "Chirino Navarro, José Antonio" , categoria: (Categoria.getAll().get(0)) , descripcion: "s/rechazo de excarcelación", estado: 'Demanda en preparación', etapaProcesal: 'Impugnativa' , juzgado:(Juzgado.getAll().get(6)) , numeroDeProcesoEnJuzgado:"46289" , observaciones: "" , responsable: (Usuario.getAll().get(5)), subCategoría: (Subcategoria.getAll().get(1)), ultimoModificador:(Usuario.getAll().get(5)) , estudio: (Estudio.getAll().get(0)), persona: (PersonaFisica.getAll().get(7)) )
		proceso.save()
		if (proceso.hasErrors()) {
			println proceso.errors
		}
		proceso = new Proceso(caratula: "Carmelo, Messina" , categoria: (Categoria.getAll().get(1)) , descripcion: "s/levantamiento de clausura", estado: 'Demanda en preparación', etapaProcesal: 'Extra-Judicial' , juzgado:(Juzgado.getAll().get(4)) , numeroDeProcesoEnJuzgado:"46045" , observaciones: "" , responsable: (Usuario.getAll().get(4)), subCategoría: (Subcategoria.getAll().get(4)), ultimoModificador:(Usuario.getAll().get(4)) , estudio: (Estudio.getAll().get(0)), persona: (PersonaJuridica.getAll().get(4)) )
		proceso.save()
		if (proceso.hasErrors()) {
			println proceso.errors
		}
		proceso = new Proceso(caratula: "Arcadi S.A. y otro(s) s/ estrago" , categoria: (Categoria.getAll().get(1)) , descripcion: "Incidente de incompetencia en autos", estado: 'Demanda en preparación', etapaProcesal: 'Extra-Judicial' , juzgado:(Juzgado.getAll().get(4)) , numeroDeProcesoEnJuzgado:"38045" , observaciones: "" , responsable: (Usuario.getAll().get(5)), subCategoría: (Subcategoria.getAll().get(6)), ultimoModificador:(Usuario.getAll().get(5)) , estudio: (Estudio.getAll().get(0)), persona: (PersonaFisica.getAll().get(8)) )
		proceso.save()
		if (proceso.hasErrors()) {
			println proceso.errors
		}
		proceso = new Proceso(caratula: "Otero, Edgardo" , categoria: (Categoria.getAll().get(0)) , descripcion: "s/rec. de control de constitucionalidad y convencionalidad", estado: 'Cerrado', etapaProcesal: 'Conclusiva' , juzgado:(Juzgado.getAll().get(1)) , numeroDeProcesoEnJuzgado:"30453" , observaciones: "" , responsable: (Usuario.getAll().get(1)), subCategoría: (Subcategoria.getAll().get(3)), ultimoModificador:(Usuario.getAll().get(1)), estudio: (Estudio.getAll().get(0)), persona: (PersonaJuridica.getAll().get(8)) )
		proceso.save()
		if (proceso.hasErrors()) {
			println proceso.errors
		}
		proceso = new Proceso(caratula: "VALDES AZUCENA" , categoria: (Categoria.getAll().get(0)) , descripcion: "C/ ANSES S/ REAJUSTES VARIOS", estado: 'Cerrado', etapaProcesal: 'Conclusiva' , juzgado:(Juzgado.getAll().get(1)) , numeroDeProcesoEnJuzgado:"1472" , observaciones: "" , responsable: (Usuario.getAll().get(1)), subCategoría: (Subcategoria.getAll().get(4)), ultimoModificador:(Usuario.getAll().get(1)) , estudio: (Estudio.getAll().get(0)), persona: (PersonaJuridica.getAll().get(8)) )
		proceso.save()
		if (proceso.hasErrors()) {
			println proceso.errors
		}
	}
	
	private void createUsersAndGroups() {
				
		/* Roles*/
		def juniorRol = SecRole.findByAuthority('ROLE_JUNIOR')
		if (!juniorRol) {
		 juniorRol = new SecRole(authority: 'ROLE_JUNIOR', name: 'Junior')
		 juniorRol.id = 'ROLE_JUNIOR'
		 juniorRol.save(failOnError: true)
		}
		def ssrRol = SecRole.findByAuthority('ROLE_SSR')
		if (!ssrRol) {
		 ssrRol = new SecRole(authority: 'ROLE_SSR', name: 'SSR')
		 ssrRol.id = 'ROLE_SSR'
		 ssrRol.save(failOnError: true)
		}
		def seniorRole = SecRole.findByAuthority('ROLE_SENIOR')
		if (!seniorRole) {
		 seniorRole = new SecRole(authority: 'ROLE_SENIOR', name: 'SENIOR')
		 seniorRole.id = 'ROLE_SENIOR'
		 seniorRole.save(failOnError: true)
		}
		/* Usuarios con su calendario y correo electronico */
		def calendar =new Calendario()
		def correoElec = new CorreoElectronico(
			contrasenia: "Sapienter01!",
			direccion: "sapienterTest@gmail.com", //replace with %40 for imap
			smtpUrl: "smtp.gmail.com",
			imapUrl: "imap.gmail.com:993/inbox")
		correoElec.save()
		
		def juniorUser = Usuario.findByUsername('franco') ?: new Usuario(
				username: 'franco',
				nombre: 'franco',
				firstName: 'franco',
				apellido: 'lezana',
				lastName: 'lezana',
				calendario: calendar,
				estudio: (Estudio.getAll().get(0)),
				comentarios:'selalastramal',
				telefono:'4354444',
				role:juniorRol,
				correoElectronico: (CorreoElectronico.findByDireccion('sapienterTest@gmail.com')),
				email: 'lezana@gmail.com',
				password: 'franco',
				enabled: true).save(failOnError: true)
		calendar.save()
		
		calendar =new Calendario()
		correoElec = new CorreoElectronico(
			contrasenia: "Sapienter01!",
			direccion: "sapienterTest2@gmail.com", //replace with %40 for imap
			smtpUrl: "smtp.gmail.com",
			imapUrl: "imap.gmail.com:993/inbox")
		correoElec.save()
		def admin = Usuario.findByUsername('admin') ?: new Usuario(
				username: 'admin',
				nombre: 'Matías',
				firstName: 'Matías',
				apellido: 'Stanislavsky',
				lastName: 'Stanislavsky',
				calendario: calendar,
				estudio: (Estudio.getAll().get(0)),
				comentarios:'Nada en particular',
				telefono:'4354242',
				role:seniorRole,
				correoElectronico: (CorreoElectronico.findByDireccion('sapienterTest@gmail.com')),
				email: 'matunga@gmail.com',
				password: 'admin',
				enabled: true).save(failOnError: true)
		calendar.save()
		
		calendar =new Calendario()
		correoElec = new CorreoElectronico(
			contrasenia: "Sapienter01!",
			direccion: "sapienterTest2@gmail.com", //replace with %40 for imap
			smtpUrl: "smtp.gmail.com",
			imapUrl: "imap.gmail.com:993/inbox")
		correoElec.save()
		def mtoth = Usuario.findByUsername('mtoth') ?: new Usuario(
				username: 'mtoth',
				correoElectronico: (CorreoElectronico.findByDireccion('sapienterTest@gmail.com')),
				email: 'matias.toth@gmail.com',
				nombre: 'Matias',
				firstName: 'Toth',
				apellido: 'Management',
				lastName: 'Management',
				calendario: calendar,
				estudio: (Estudio.getAll().get(0)),
				comentarios:'todo en particular',
				telefono:'4354222',
				role:ssrRol,
				password: 'mtoth',
				enabled: true).save(failOnError: true)
		calendar.save()

		calendar =new Calendario()
		correoElec = new CorreoElectronico(
			contrasenia: "Sapienter01!",
			direccion: "sapienterTest2@gmail.com", //replace with %40 for imap
			smtpUrl: "smtp.gmail.com",
			imapUrl: "imap.gmail.com:993/inbox")
		correoElec.save()
		def rperrone = Usuario.findByUsername('rperrone') ?: new Usuario(
				username: 'rperrone',
				correoElectronico: (CorreoElectronico.findByDireccion('sapienterTest@gmail.com')),
				email: 'romina.perrone@gmail.com',
				nombre: 'Romina',
				firstName: 'Perrone',
				apellido: 'Management',
				lastName: 'Management',
				calendario: calendar,
				estudio: (Estudio.getAll().get(0)),
				comentarios:'todo en particular',
				telefono:'4354222',
				role:ssrRol,
				password: 'rperrone',
				enabled: true).save(failOnError: true)
		calendar.save()

		calendar =new Calendario()
		correoElec = new CorreoElectronico(
			contrasenia: "Sapienter01!",
			direccion: "sapienterTest2@gmail.com", //replace with %40 for imap
			smtpUrl: "smtp.gmail.com",
			imapUrl: "imap.gmail.com:993/inbox")
		correoElec.save()
		def mstani = Usuario.findByUsername('mstani') ?: new Usuario(
				username: 'mstani',
				correoElectronico: (CorreoElectronico.findByDireccion('sapienterTest@gmail.com')),
				email: 'matias.stani@gmail.com',
				nombre: 'Matias',
				firstName: 'Stanislavsky',
				apellido: 'Management',
				lastName: 'Management',
				calendario: calendar,
				estudio: (Estudio.getAll().get(0)),
				comentarios:'todo en particular',
				telefono:'4354222',
				role:ssrRol,
				password: 'mstani',
				enabled: true).save(failOnError: true)
		calendar.save()
		
		calendar =new Calendario()
		correoElec = new CorreoElectronico(
			contrasenia: "Sapienter01!",
			direccion: "sapienterTest2@gmail.com", //replace with %40 for imap
			smtpUrl: "smtp.gmail.com",
			imapUrl: "imap.gmail.com:993/inbox")
		correoElec.save()
		def nsouto = Usuario.findByUsername('nsouto') ?: new Usuario(
				username: 'nsouto',
				correoElectronico: (CorreoElectronico.findByDireccion('sapienterTest@gmail.com')),
				email: 'nicolas.souto@gmail.com',
				nombre: 'Nicolas',
				firstName: 'Souto',
				apellido: 'Management',
				lastName: 'Management',
				calendario: calendar,
				estudio: (Estudio.getAll().get(0)),
				comentarios:'todo en particular',
				telefono:'4354222',
				role:ssrRol,
				password: 'nsouto',
				enabled: true).save(failOnError: true)
		calendar.save()
		
		if (!juniorUser.authorities.contains(juniorRol)) {
			SecUserSecRole.create juniorUser, juniorRol
		}
		
		if (!admin.authorities.contains(seniorRole)) {
			SecUserSecRole.create admin, seniorRole
		}
		
		if (!nsouto.authorities.contains(ssrRol)) {
			SecUserSecRole.create nsouto, ssrRol
		}
	}
	def destroy = {
	}
}


