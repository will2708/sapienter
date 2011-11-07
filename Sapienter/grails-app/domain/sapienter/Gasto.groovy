package sapienter

import ar.com.fdvs.dj.core.layout.HorizontalBandAlignment
import ar.com.fdvs.dj.domain.AutoText
//TODO: bajar plugin de monedas, generar archivo con tipos de estado
class Gasto {
	def static reportable = [
		columns: ['concepto', 'estado', 'fecha', 'monto', 'moneda'],
		columnTitles: ['concepto': 'Concepto', 'estado': 'Estado', 'fecha': 'Fecha', 'monto':'Monto', 'moneda': 'Moneda'],
		autoTexts: [new AutoText(AutoText.AUTOTEXT_PAGE_X_OF_Y, AutoText.POSITION_FOOTER, HorizontalBandAlignment.buildAligment(AutoText.ALIGMENT_CENTER), (byte)0, 200, 200)]]
			String concepto
			String estado
			String facturaArchivo
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
		facturaArchivo(blank:true)
		factura(nullable:true)
    }
	
	String toString(){
		concepto
	}
	
	static belongsTo = [proceso:Proceso]
}
