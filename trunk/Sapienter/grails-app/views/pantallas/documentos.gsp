<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        
        <z:head zul="/sapienter/pantallas/documentos.zul"/>
        <title>Sapienter</title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
        <z:body zul="/sapienter/pantallas/test.zul"/>	    
            <fckeditor:editor 
                                    	name="composicion" 
                                    	width="100%"
                                    	height="60%"
                                   	/>
        
            
        </div>
    </body>
</html>