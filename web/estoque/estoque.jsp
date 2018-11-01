<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <meta charset="utf-8">
    <title>Estoque</title>
    <%@include file="include/style.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Grupo 11 - Estoque" />
    <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico" />
</head>

<body>
<%@include file="include/topo.jsp" %>
<%@include file="include/menu.jsp" %>

<div class="cont" id="main">

    <section id="estoque" class="container-estoque">
        <h2 class="h2-estoque">Estoque</h2>
        <div class="estoque-home">
            <ul class="ul-estoque-home">
                <li class="li-estoque-home"><a href="#estoque">Estoque</a></li>
                <div class="menuDown-estoque">
                    <li><a onclick="mostraConteudo('novo-item'); carregaDados('novo-item')">Novo Item</a></li>
                    <li><a onclick="mostraConteudo('estoque-atual')">Estoque Atual</a></li>
                    <li><a onclick="mostraConteudo('suprimento')">Suprimento</a></li>
                    <li><a onclick="mostraConteudo('separacao')">Separação</a></li>
                    <li><a onclick="mostraConteudo('reposicionar')">Reposicionar</a></li>
                    <li><a onclick="mostraConteudo('inventario')">Inventário</a></li>
                    <li><a onclick="mostraConteudo('configurar-estoque')">Configurar Estoque</a></li>
                </div>
            </ul>
        </div>
        <div class="estoque-home">
            <ul class="ul-estoque-home">
                <li class="li-estoque-home"><a href="#estoque">Solicitação de Compra</a></li>
                <div class="menuDown-estoque">
                    <li><a onclick="mostraConteudo('nova-solicitacao')">Solicitar Compra</a></li>
                    <li><a onclick="mostraConteudo('solicitacoes-de-compras')">Solicitações de Compra</a></li>
                </div>
            </ul>
        </div>
        <div class="estoque-home">
            <ul class="ul-estoque-home">
                <li class="li-estoque-home"><a class="menuDown-estoque" href="#estoque">Vendas</a></li>
                <div class=" menuDown-estoque">
                    <li><a href="#vendas" onclick="mostraConteudo('vendas')">Ordens de Venda</a></li>
                </div>
            </ul>
        </div>

        <div class="estoque-home">
            <ul class="ul-estoque-home">
                <li class="li-estoque-home"><a class="menuDown-estoque" href="#estoque">Pedido de Material</a></li>
                <div class=" menuDown-estoque">
                    <li><a href="#pedidos" onclick="mostraConteudo('pedidos')">Pedido de Material</a></li>
                </div>
            </ul>
        </div>

        <div class="estoque-home">
            <ul class="ul-estoque-home">
                <li class="li-estoque-home"><a href="#estoque" class="menuDown-estoque">Relatórios</a></li>

                <div class=" menuDown-estoque">
                    <li><a onclick="mostraConteudo('movimentacao')">Movimentação</a></li>
                    <li><a onclick="mostraConteudo('dashboard')">Dashboard</a></li>
                </div>
            </ul>
        </div>
    </section>

            
    <section id="novo-item" class="container-estoque">
        <div class="col-md-12">
            <div class="border-titulo">
                <h2>Novo Item</h2>
                <br>
                
                <div class="col-md-12 p-30 table-responsive">
                    <table class="table table-condensed">
                        <tr>
                            <td><label for="nome_novo_item">Nome</label></td>
                            <td colspan="3"><input type="text" class="form-control" id="nome_novo_item" placeholder="Nome do Produto" novo-item></td>
                        </tr>
                        <tr>
                            <td><label for="tipo_novo_item">Tipo</label></td>
                            <td colspan="3">
                                <select class="form-control select2" id="tipo_novo_item">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="descricao_novo_item">Descrição</label></td>
                            <td colspan="3"><textarea rows="3" class="form-control" id="descricao_novo_item" placeholder="Descrição do Produto" novo-item></textarea></td>
                        </tr>
                        <tr>
                            <td><label for="marca_novo_item">Marca</label></td>
                            <td colspan="3"><input type="text" class="form-control" id="marca_novo_item" placeholder="Marca do Produto" novo-item></td>
                        </tr>
                        <tr>
                            <td><label for="preco_novo_item">Preço</label></td>
                            <td><input type="text" class="form-control" id="preco_novo_item" placeholder="Preço do Produto" novo-item></td>
                            <td><label for="quantidade_novo_item">Quantidade</label></td>
                            <td><input type="number" min="0" class="form-control" id="quantidade_novo_item" placeholder="Quantidade do Produto" novo-item></td>
                        </tr>
                        <tr>
                            <td><label for="qtde_minima_novo_item">Qtde. Miníma</label></td>
                            <td><input type="number" min="0" class="form-control" id="qtde_minima_novo_item" placeholder="Quantidade Miníma" novo-item></td>
                            <td><label for="qtde_maxima_novo_item">Qtde. Máxima</label></td>
                            <td><input type="number" min="0" class="form-control" id="qtde_maxima_novo_item" placeholder="Quantidade Máxima" novo-item></td>
                        </tr>
                    </table>
                </div>

                <p class="page-link text-right pr-15">
                    <button type="button" class="btn btn-amarelo btn-hover" id="limpar_novo_item">LIMPAR</button>
                    <button type="button" class="btn btn-verde btn-hover mr-10" id="gravar_novo_item">GRAVAR</button>
                </p>
                <div class="clearfix"></div>

            </div>

        </div>
    </section>

    <section id="estoque-atual" class="container-estoque">
        <div class="col-md-12">
            <div class="border-titulo">
                <p class="page-btn text-right pr-15">
                    <a href="gerenciar-registro-fiscal-entrada.html" class="btn btn-verde btn-hover mr-10">NOVO REGISTRO</a>
                    <a href="#" onClick="popup_filtrar()" class="btn btn-amarelo btn-hover">FILTRAR</a>
                </p>
                <h2>Novo Item</h2>
                <br>
                <div class="col-md-12 p-30 table-responsive">
                    <table id="frm" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Data de Emissão</th>
                                <th>Destinário</th>
                                <th>CPF/CNPJ</th>
                                <th>Natureza da Operação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr onclick="window.location='gerenciar-registro-fiscal-entrada.html'">
                                <td>#0001</td>
                                <td>01/01/2018</td>
                                <td>TESTES LTDA</td>
                                <td>111.111.111-11</td>
                                <td>Venda</td>
                            </tr>
                            <tr onclick="window.location='gerenciar-registro-fiscal-entrada.html'">
                                <td>#0002</td>
                                <td>02/02/2018</td>
                                <td>TESTES LTDA</td>
                                <td>222.222.222-22</td>
                                <td>Compra</td>
                            </tr>
                            <tr onclick="window.location='gerenciar-registro-fiscal-entrada.html'">
                                <td>#0003</td>
                                <td>03/03/2018</td>
                                <td>TESTES LTDA</td>
                                <td>333.333.333-33</td>
                                <td>Venda</td>
                            </tr>
                            <tr onclick="window.location='gerenciar-registro-fiscal-entrada.html'">
                                <td>#0004</td>
                                <td>04/04/2018</td>
                                <td>TESTES LTDA</td>
                                <td>444.444.444-44</td>
                                <td>Venda</td>
                            </tr>
                            <tr onclick="window.location='gerenciar-registro-fiscal-entrada.html'">
                                <td>#0005</td>
                                <td>05/05/2018</td>
                                <td>TESTES LTDA</td>
                                <td>555.555.555-55</td>
                                <td>Venda</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </section>

    <section id="suprimento" class="container-estoque">
        <h1>Suprimento</h1>
    </section>

    <section id="separacao" class="container-estoque">
        <h1>Separação</h1>
    </section>

    <section id="configurar-estoque" class="container-estoque">
        <h1>Configurar Estoque</h1>
    </section>

    <section id="reposicionar" class="container-estoque">
        <h1>Reposicionar</h1>
    </section>

    <section id="inventario" class="container-estoque">
        <h1>Inventário</h1>
    </section>

    <section id="nova-solicitacao" class="container-estoque">
        <h1>Solicitar Compra</h1>
    </section>

    <section id="solicitacoes-de-compras" class="container-estoque">
        <h1>Solicitações de Compra</h1>
    </section>

    <section id="vendas" class="container-estoque">
        <h1>Orderns de Vendas</h1>
    </section>

    <section id="pedidos" class="container-estoque">
        <h1>Pedido de Material</h1>
    </section>

    <section id="movimentacao" class="container-estoque">
        <h1>Movimentação</h1>
    </section>

    <section id="dashboard" class="container-estoque">
        <h1>Dashboard</h1>
    </section>

</div>

<div id="popup"></div>

<%@include file="include/plugins.jsp" %>

<script>
function mostraConteudo(id){
    $('.container-estoque').css('display','none');
    $('#'+id).css('display','inline');
}

function carregaDados(id){
    if(id === 'novo-item'){
        var $tipo = '<option value="-1">Carregando...</option>';
        $('#tipo_novo_item').html($tipo);

        $.getJSON("../CarregaDados", {opcao: id}).success(function(json){
            console.log(json);
            $tipo = '<option value="-1">Selecione o tipo</option>';
            json.dados.forEach(function(a,index){
                $tipo += '<option value="'+a.id+'">'+a.nome+'</option>';
            })
            console.log($tipo);
            $('#tipo_novo_item').html($tipo);
        })
        .error(function(e){
            console.log(e);
        });
    }
}

$(function(){

    //Datemask dd/mm/yyyy
    //$('#preco_novo_item').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })

    //colocar função para apenas numero e mascara para valor

    $("#gravar_novo_item").click(function(){
        var nome = preenchimentoObrigatorio('nome_novo_item',1);
        var tipo = preenchimentoObrigatorio('tipo_novo_item',2);
        var descricao = preenchimentoObrigatorio('descricao_novo_item',1);
        var marca = $('#marca_novo_item').val();
        var preco = $('#preco_novo_item').val();
        var qtde = $('#quantidade_novo_item').val();
        var qtde_minima = $('#qtde_minima_novo_item').val();
        var qtde_maxima = $('#qtde_maxima_novo_item').val();
        
        if(nome == false || tipo == false || descricao == false){
            return false;
        }
        else{
            $.getJSON("../CarregaDados", {opcao: 'grava-item', nome:nome, tipo:tipo, descr:descricao, marca:marca, preco:preco, qtde:qtde, qtdeMin:qtde_minima, qtdeMax:qtde_maxima})
            .success(function(json){
                console.log(json);
        
                if(json == '1'){
                    alert("Item gravado com sucesso!!!");
                    $("#limpar_novo_item").click();
                }
                
                
            })
            .error(function(e){
                console.log(e);
            });
        }
  
    });
    
    $("#limpar_novo_item").click(function(){
       $("#nome_novo_item, #descricao_novo_item, #marca_novo_item, #preco_novo_item, #quantidade_novo_item, #qtde_minima_novo_item, #qtde_maxima_novo_item").val("");
       $("#tipo_novo_item").val('-1');
    });
});

</script>
</body>
</html>
