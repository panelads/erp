<div id="btnMenu"><img src="img/btn-menu.png"></div>
<nav>
    <ul>
        <li><a class="menuDown">Estoque</a></li>
        <div class="dropDown">
            <li><a onclick="mostraConteudo('novo-item'); carregaDados('novo-item')">Novo Item</a></li>
            <li><a onclick="mostraConteudo('estoque-atual'); carregaDados('estoque-atual')">Estoque Atual</a></li>
            <li><a onclick="mostraConteudo('suprimento')">Suprimento</a></li>
            <li><a onclick="mostraConteudo('separacao')">Separa��o</a></li>
            <li><a onclick="mostraConteudo('reposicionar')">Reposicionar</a></li>
            <li><a onclick="mostraConteudo('inventario')">Invent�rio</a></li>
            <li><a onclick="mostraConteudo('configurar-estoque');carregaDadosConfig()">Configurar Estoque</a></li>
        </div>
        <li><a class="menuDown">Solicita��o de Compra</a></li>
        <div class="dropDown">
            <li><a onclick="mostraConteudo('nova-solicitacao')">Solicitar Compra</a></li>
            <li><a onclick="mostraConteudo('solicitacoes-de-compras')">Solicita��es de Compra</a></li>
        </div>
        <li><a onclick="mostraConteudo('vendas')" class="menuDown">Ordem de Venda</a></li>
        <li><a onclick="mostraConteudo('pedidos')" class="menuDown">Pedido de Material</a></li>
        <li><a class="menuDown">Relat�rios</a></li>
        <div class="dropDown">
            <li><a onclick="mostraConteudo('movimentacao')">Movimenta��o</a></li>
            <li><a onclick="mostraConteudo('dashboard')">Dashboard</a></li>
        </div>
        <li><a href="../modulos.jsp">Alterar M�dulo</a></li>
    </ul>
</nav>
