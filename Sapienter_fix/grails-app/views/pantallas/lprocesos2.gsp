<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        
        <z:head zul="/sapienter/pantallas/proceso.zul"/>
        <title>Sapienter</title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
        <z:body zul="/sapienter/pantallas/test.zul"/>	
            
        </div>
    </body>
</html>