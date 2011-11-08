<html>
    <head>
        <title>Bienvenido a Sapienter.org</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }

        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:2%;
        }
        </style>
        <icep:bridge/>
    </head>
    <body>
        <div id="pageBody">
            <h1>Sapienter</h1>
            <p>Bienvenido a la página principal de Sapienter</p>

            <div id="controllerList" class="dialog">
                <h2>Controladores disponibles</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                </ul>
            </div>

        </div>
    </body>
</html>
