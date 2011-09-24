package sapienter
//TODO: bajar plugin de monedas, generar archivo con tipos de estado
class Gasto {
			String concepto
			String estado
			byte[] factura
			Date fecha
			String moneda
			Float monto
			
    static constraints = {
		concepto(blank:false)		
		estado(inList:["Rendido","Pagado","Reclamado"],blank:false)		
		fecha(blank:false)
		moneda(inList:['Pesos','Dolares','Euros'],blank:false)
		monto(blank:false)
		factura()
    }
	
	static belongsTo = [proceso:Proceso]
}
