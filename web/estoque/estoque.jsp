<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <meta charset="utf-8">
    <title>Panela ADS - Módulo Estoque</title>
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
                    <li><a onclick="mostraConteudo('estoque-atual'); carregaDados('estoque-atual')">Estoque Atual</a></li>
                    <li><a onclick="mostraConteudo('suprimento')">Suprimento</a></li>
                    <li><a onclick="mostraConteudo('separacao')">Separação</a></li>
                    <li><a onclick="mostraConteudo('reposicionar')">Reposicionar</a></li>
                    <li><a onclick="mostraConteudo('inventario')">Inventário</a></li>
                    <li><a onclick="mostraConteudo('configurar-estoque'); carregaDadosConfig()">Configurar Estoque</a></li>
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
                            <td><label for="local_fisico_novo_item">Local Fisíco</label></td>
                            <td colspan="3">
                                <select class="form-control select2" id="local_fisico_novo_item">
                                </select>
                            </td>
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
                <h2>Estoque Atual</h2>
                <br>
                <div class="col-md-12 p-30 table-responsive">
                    <table class="table table-bordered" style="background: #fff">
                        <tr>
                            <th colspan="4">Filtros</th>
                        </tr>
                        <tr>
                            <th><label for="codigo_estoque_atual">Código</label></th>
                            <td><input type="text" class="form-control" id="codigo_estoque_atual"></td>
                            <th><label for="descricao_estoque_atual">Descrição</th>
                            <td><input type="text" class="form-control" id="descricao_estoque_atual"></td>
                        </tr>    
                        <tr>
                            <th><label for="marca_estoque_atual">Marca</label></th>
                            <td><input type="text" class="form-control" id="marca_estoque_atual"></td>
                            <th><label for="tipo_estoque_atual">Categoria</label></th>
                            <td>
                                <select class="form-control select2" id="tipo_estoque_atual">
                                </select>
                            </td>
                        </tr> 
                        <tr>
                            <th colspan="4"><button type="button" class="pull-right btn btn-azul btn-hover mr-10" id="buscar_estoque_atual">BUSCAR</button></th>
                        </tr>
                    </table>
                    
                    <table id="table-estoque-atual" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Produto</th>
                                <th>Marca</th>
                                <th>Tipo de Material</th>
                                <th colspan="2">Estoque</th>
                                <th>Local Fisíco</th>
                                <!--<th>Alterar</th>-->
                            </tr>
                        </thead>
                        <tbody>
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
        <div class="col-md-12">
            <div class="border-titulo">
                <h2>Configurar Estoque</h2>
                <br>
                
                <div class="col-md-12 p-30 table-responsive">
                    <table class="table table-condensed">
                        <tr>
                            <td><label for="conf_tipo_material">Tipo de Material</label></td>
                            <td><input type="text" class="form-control" id="conf_tipo_material" placeholder="Informe o Tipo de Material" conf-endereco></td>
                            <td><button type="button" class="btn btn-verde btn-hover mr-10" id="gravar_tipo_material">GRAVAR</button></td>
                        </tr>
                        <tr>
                            <td colspan="3">Tipo(s) de Material Cadastrado(s)</td
                        </tr>
                        <tr>
                            <td colspan="3">
                                <table class="table table-bordered" id="table-tipo-material">
                                    <thead>
                                        <tr>
                                            <th>Descrição</th>
                                            <th>Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        
                    </table>
                </div>

                <div class="clearfix"></div>

            </div>

        </div>
        
        
        
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
    if(id == 'novo-item'){
        var $tipo = '<option value="-1">Carregando...</option>';
        $('#tipo_novo_item').html($tipo);
        var $local = '<option value="-1">Carregando...</option>';
        $('#local_fisico_novo_item').html($local);

        $.getJSON("../CarregaDados", {opcao: id}).success(function(json){
            //console.log(json);
            $tipo = '<option value="-1">Selecione o tipo</option>';
            json.dados.forEach(function(a,index){
                $tipo += '<option value="'+a.id+'">'+a.nome+'</option>';
            })
            $('#tipo_novo_item').html($tipo);

            $local = '<option value="-1">Selecione o Local Fisíco</option>';
            json.locais.forEach(function(a,index){
                $local += '<option value="'+a.id_local+'">'+a.local+'</option>';
            })
            $('#local_fisico_novo_item').html($local);
        })
        .error(function(e){
            console.log(e);
        });
    }
    else if(id == 'estoque-atual'){
        var $estoque;
        $.getJSON("../CarregaDados", {opcao: id}).success(function(json){
            console.log(json);

            json.item.forEach(function(a,index){
                $estoque += '<tr>'+
                    '<td>'+a.id_item+'</td>'+
                    '<td>'+a.nome+'</td>'+
                    '<td>'+a.marca+'</td>'+
                    '<td>'+a.nome_tipo+'</td>'+
                    '<td>'+a.qtde+'</td>'+
                    '<td style="text-align:center"><i class="fa fa-check-circle" style="color: green"></i></td>'+
                    '<td>'+a.local_fisico+'</td>'+
                    //'<td><button type="button" class="btn btn-azul btn-hover btn-xs" onclick=\'popAlteraEstoqueAtual('+a.id_item+', "'+a.nome+'", "'+a.marca+'", '+a.nome_tipo+', '+a.qtde+', '+a.local_fisico+')\'>Alterar</button></td>'+
                '</tr>';
            })
            $('#table-estoque-atual tbody').html($estoque);

        })
        .error(function(e){
            console.log(e);
        });
        
        $.getJSON("../CarregaDados", {opcao: 'novo-item'}).success(function(json){
            //console.log(json);
            $tipo = '<option value="-1">Selecione o tipo</option>';
            json.dados.forEach(function(a,index){
                $tipo += '<option value="'+a.id+'">'+a.nome+'</option>';
            })
            $('#tipo_estoque_atual').html($tipo);

        })
        .error(function(e){
            console.log(e);
        });
    }
}

function carregaDadosConfig(){ //carrega tipo da section configura estoque
    var $tipo;
    $.getJSON("../CarregaDados", {opcao: 'novo-item'}).success(function(json){
        console.log(json);
        json.dados.forEach(function(a,index){
            $tipo += '<tr>'+
                '<td>'+a.nome+'</td>'+
                '<td><button type="button" class="btn btn-vermelho btn-hover btn-xs" onclick="conf_excluir_tipo('+a.id+')" '+(a.controle != 0 ? 'disabled' : '')+'>'+(a.controle != 0 ? 'TIPO VINCULADO AO ITEM' : 'EXCLUIR')+'</button</td>'+
            '</tr>';
        })
        $('#table-tipo-material tbody').html($tipo);
    })
    .error(function(e){
        console.log(e);
    });
}
function conf_excluir_tipo(id){
    $.getJSON("../CarregaDados", {opcao: 'exclui-tipo-material', id:id}).success(function(json){
        //console.log(json);
        alert("Tipo de Material excluído com sucesso!");
        carregaDadosConfig();
    })
    .error(function(e){
        console.log(e);
    });
}

$(function(){

    //Datemask dd/mm/yyyy
    //$('#preco_novo_item').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })

    //colocar função para apenas numero e mascara para valor

//########## INICIO FUNÇÕES PARA SECTION NOVO ITEM #########
    $("#gravar_novo_item").click(function(){
        var $nome = preenchimentoObrigatorio('nome_novo_item',1);
        var $tipo = preenchimentoObrigatorio('tipo_novo_item',2);
        var $descricao = preenchimentoObrigatorio('descricao_novo_item',1);
        var $marca = $('#marca_novo_item').val();
        var $local_fisico = preenchimentoObrigatorio('local_fisico_novo_item',2);
        var $preco = $('#preco_novo_item').val();
        var $qtde = $('#quantidade_novo_item').val();
        var $qtde_minima = $('#qtde_minima_novo_item').val();
        var $qtde_maxima = $('#qtde_maxima_novo_item').val();
        
        if($nome == false || $tipo == false || $descricao == false){
            return false;
        }
        else{
            $.getJSON("../CarregaDados", {opcao: 'grava-item', nome:$nome, tipo:$tipo, descr:$descricao, marca:$marca, local_fisico:$local_fisico, preco:$preco, qtde:$qtde, qtdeMin:$qtde_minima, qtdeMax:$qtde_maxima})
            .success(function(json){
                //console.log(json);
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
       $("#tipo_novo_item, #local_fisico_novo_item").val('-1');
    });
//########## FIM FUNÇÕES PARA SECTION NOVO ITEM #########

//########## INICIO FUNÇÕES PARA SECTION CONFIGURA ESTOQUE #########
    $("#gravar_tipo_material").click(function(){
        var $tipo_material = $('#conf_tipo_material').val();
        
        if($tipo_material == false || $tipo_material == 0){
            alert('Informe o Tipo de Material');
            $('#conf_tipo_material').focus();
            return false;
        }
        else{
            $.getJSON("../CarregaDados", {opcao: 'grava-tipo-material', tipo_material:$tipo_material})
            .success(function(json){
               console.log(json);
                if(json == '1'){
                    alert("Tipo de Material gravado com sucesso!!!");
                    $("#conf_tipo_material").val('');
                    carregaDadosConfig();
                }
                else if(json == '2'){
                    alert("Tipo de Material já existe!");
                    $("#conf_tipo_material").val('').focus();
                }
            })
            .error(function(e){
                console.log(e);
            });
        }
    });

//########## FIM FUNÇÕES PARA SECTION CONFIGURA ESTOQUE #########

//########## INICIO FUNÇÕES PARA SECTION ESTOQUE ATUAL #########
    $('#buscar_estoque_atual').click(function(){
        var $codigo = $('#codigo_estoque_atual').val();
        var $descricao = $('#descricao_estoque_atual').val();
        var $marca = $('#marca_estoque_atual').val();
        var $tipo_material = $('#tipo_estoque_atual').val();
        $tipo_material = $tipo_material == '-1' ? '' : $tipo_material;
        
        if($codigo == '' && $descricao == '' && $marca == '' && $tipo_material == '-1'){
            carregaDados('estoque-atual');
        }
        else{
            $.getJSON("../CarregaDados", {opcao: 'busca-estoque-atual', codigo:$codigo, descricao:$descricao, marca:$marca, tipo_material:$tipo_material})
            .success(function(json){
               var $estoque; 
               console.log(json);
                json.item.forEach(function(a,index){
                    $estoque += '<tr>'+
                        '<td>'+a.id_item+'</td>'+
                        '<td>'+a.nome+'</td>'+
                        '<td>'+a.marca+'</td>'+
                        '<td>'+a.nome_tipo+'</td>'+
                        '<td>'+a.qtde+'</td>'+
                        '<td style="text-align:center"><i class="fa fa-check-circle" style="color: green"></i></td>'+
                        '<td>'+a.local_fisico+'</td>'+
                        //'<td><button type="button" class="btn btn-azul btn-hover btn-xs">Alterar</button></td>'+
                    '</tr>';
                })
                $('#table-estoque-atual tbody').html($estoque);
            })
            .error(function(e){
                console.log(e);
            });
        }
    });
//########## FIM FUNÇÕES PARA SECTION ESTOQUE ATUL #########


});

</script>
</body>
</html>
