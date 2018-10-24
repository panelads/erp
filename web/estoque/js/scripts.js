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
            alert('Campo Obrigatório não selecionado!');
            $('#'+id).focus();
            return false;
        }else{
            return campo;
        }
    }
    
}