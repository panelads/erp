<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <meta charset="utf-8">
    <title>Caixa</title>
    <%@include file="include/style.jsp" %>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Grupo 3 - Caixa" />

    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
</head>

<body>

    <%@include file="include/topo.jsp" %>
    <%@include file="include/menu.jsp" %>

    <div class="cont">

        <div class="col-md-12">
            <div class="border-titulo pb-20 pb-0-mob">

                <h2>Meu perfil</h2>

                <br><br>

                <div class="col-md-2">
                    <img src="img/icon-perfil.jpg" style="width:100%;" />
                </div>

                <div class="col-md-4 mt-30-mob">
                    <p><strong>Nome:</strong> Teste de teste</p>
                    <p><strong>Data de Nascimento:</strong> 00/00/0000</p>
                    <p><strong>Cargo:</strong> X</p>
                    <p><strong>...</strong></p>
                </div>

                <div class="clearfix"></div>
        
            </div>
        </div>

    </div>

<div id="popup"></div>

<%@include file="include/plugins.jsp" %>

</body>
</html>