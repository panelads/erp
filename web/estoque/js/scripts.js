function preenchimentoObrigatorio(id, tipo){
    var campo = $('#'+id).val();
    if(tipo == 1){ // tipo 1 campo input text ou number
        if(campo == ''){
            alert('Campo Obrigatório não preenchido!');
            $('#'+id).focus();
            return false;
        }else{
            return campo;
        }
    }else if(tipo == 2){ // tipo 2 camp select
        if(campo == '-1'){
            alert('Campo Acentuação não selecionado!');
            $('#'+id).focus();
            return false;
        }else{
            return campo;
        }
    }
}

//apenas numeros
$('#qtde_minima_novo_item, #qtde_maxima_novo_item, #quantidade_novo_item, #codigo_estoque_atual').keyup(function() {
  $(this).val(this.value.replace(/\D/g, ''));
});

//Mascara para moeda
$(function() {
  $('#preco_novo_item').mask('#.##0,00', {reverse: true});
})

function fecha_popup(){
    $("#popup").html("");
}

function popAlteraEstoqueAtual(){
    $("#popup").html("");
    var conteudo = "<div id='myModal fade' class='modal'>"+
        "<div class='modal-content' style='border-radius:10px; width: 80%'>"+
            "<span class='close' onClick='fecha_popup()'>&times;</span>"+
            "<h3>ALTERAR ITEM</h3>"+
            "<table>"+
                "<tr>"+
                    "<td></td>"+
                "</tr>"+
            "</table>"+
            "<div class='clearfix'></div>"+
        "</div>"+
    "</div>";
    $("#popup").html(conteudo);
}