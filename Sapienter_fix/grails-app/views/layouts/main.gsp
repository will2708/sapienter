<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Sapienter" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
    </head>
    <body>
		<script src="${resource(dir:'js',file:'sapienter.js')}"></script>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
          <div id="SapienterLogo"><a href="http://www.sapienter.org"><img src="${resource(dir:'images',file:'Logo.jpg')}" alt="Sapienter Pensado para el asesoramiento jur�dico" border="0" /></a></div>
		            
        <g:layoutBody />

    </body>
</html>