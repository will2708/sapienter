package sapienter
//TODO: Verificar el tema de aprobadores.
import org.grails.activiti.ApprovalStatus
class Documento {
	String contenidoDocumento
	String descripcion
	String nombre
	String tipoDeDocumento
	Usuario usuarioResponsable  
	ApprovalStatus estado = ApprovalStatus.PENDING
	String approvalRemark
	Boolean reenviarDocumento

    static constraints = {
		nombre(blank:false)
		descripcion(blank:false)
		estado nullable:false
		tipoDeDocumento(inList:['Procesal','Extraprocesal'])
		usuarioResponsable()
		contenidoDocumento()
		approvalRemark nullable:true
		reenviarDocumento nullable:true
    }

	String toString(){
		nombre
	}
		
	static belongsTo = [proceso:Proceso]
}
