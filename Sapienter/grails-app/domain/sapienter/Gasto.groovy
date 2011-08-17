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
		estado(blank:false,inList["Rendido","Pagado","Reclamado"])
		fecha(blank:false)
		moneda(blank:false,inList["Pesos","Dolares","Euros"])
		monto(blank:false)
		factura()
    }
	
	static belongsTo = [proceso:Proceso]
}
