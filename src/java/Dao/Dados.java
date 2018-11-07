package Dao;
import Basic.NovoItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Duilor
 */
public class Dados {
    
    public String inserirNovoItem(NovoItem item){
        String resp;
        try{
            Connection con = Conecta.getConexao();
            PreparedStatement pstm;

            String sqlLocal = "INSERT INTO estoque (local_fisico) VALUES (?)";
            pstm = con.prepareStatement(sqlLocal);
            pstm.setString(1, "E"+item.getLocalFisico());
            pstm.executeUpdate();
            
            String sql = "INSERT INTO item (nome, descricao, preco, marca, quantidadeTotal, EstoqueMin, EstoqueMax, tipo_item_id_tipo, local_fisico) "
                    + "VALUES (? , ? , ? , ? , ? , ? , ? , ?, ?)";
            pstm = con.prepareStatement(sql);
            
            pstm.setString(1, item.getNome());
            pstm.setString(2, item.getDescricao());
            pstm.setDouble(3, item.getPreco());
            pstm.setString(4, item.getMarca());
            pstm.setInt(5, item.getQtde());
            pstm.setInt(6, item.getQtdeMin());
            pstm.setInt(7, item.getQtdeMax());
            pstm.setInt(8, item.getTipo());
            pstm.setInt(9, item.getLocalFisico());

            pstm.executeUpdate();
            pstm.close();
            con.close();
            resp = "1";

        }catch(Exception ex){
            resp = "Erro "+ex.getMessage();
        }
        return resp;
    }
    
    public String inserirTipoMaterial(String tipo_material){
        String resp;
        try{
            Connection con = Conecta.getConexao();
            
            String sqlConsulta = "SELECT nome_tipo FROM tipo_item WHERE nome_tipo = ?";
            PreparedStatement consulta = con.prepareStatement(sqlConsulta);
            consulta.setString(1, tipo_material);
            ResultSet r = consulta.executeQuery();
            String controle = "";
            while(r.next()){
                controle = r.getString("nome_tipo");
            }
            if(controle.equalsIgnoreCase(tipo_material)){
                resp = "2";//j· existe
            }
            else{
           
                String sql = "INSERT INTO tipo_item (nome_tipo) VALUES (?)";
                PreparedStatement pstm = con.prepareStatement(sql);

                pstm.setString(1, tipo_material);

                pstm.executeUpdate();
                pstm.close();
                con.close();
                resp = "1";//cadastrado com sucesso
            }

        }catch(Exception ex){
            resp = "Erro "+ex.getMessage();
        }        
        return resp;
    }
    
    public String excluirTipoMaterial(int id){
        String resp;
        try{
            Connection con = Conecta.getConexao();
            
            String sql = "DELETE FROM tipo_item WHERE id_tipo = ?";
            PreparedStatement pstm = con.prepareStatement(sql);
            
            pstm.setInt(1, id);
            
            pstm.executeUpdate();
            pstm.close();
            con.close();
            resp = "1";//excluido com sucesso
            
        }catch(Exception ex){
            resp = "Erro "+ex.getMessage();
        }        
        return resp;
    }
    
    public String CarregaTipo(){
        String resp;
        try{
            Connection con = Conecta.getConexao();
            JSONObject json = new JSONObject();
            JSONArray arrayLocal = new JSONArray();
            JSONArray arrayTipo = new JSONArray();

            PreparedStatement ps;
            ResultSet rs;

            
            String sqlLocal = "SELECT COUNT(id_local_fisico)+1 'id_local_fisico', COUNT(*)+1 'local' FROM estoque;"; 
            ps = con.prepareStatement(sqlLocal);
            rs = ps.executeQuery();
            while(rs.next()){
                JSONObject itemLocal = new JSONObject();
                itemLocal.put("id_local", rs.getInt("id_local_fisico"));
                itemLocal.put("local", "E"+rs.getString("local"));
                arrayLocal.add(itemLocal);  
            }
            json.put("locais", arrayLocal);
            
            
            String sql = "SELECT id_tipo, nome_tipo, COUNT(i.id_item) 'controle' " +
                            "FROM tipo_item ti " +
                            "LEFT JOIN item i ON ti.id_tipo=i.tipo_item_id_tipo " +
                            "GROUP BY id_tipo, nome_tipo " +
                            "ORDER BY nome_tipo";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();


            while(rs.next()){
                JSONObject item = new JSONObject();

                item.put("id", rs.getInt("id_tipo"));
                item.put("nome", rs.getString("nome_tipo"));
                item.put("controle", rs.getString("controle"));
                arrayTipo.add(item);  
            }
            json.put("dados", arrayTipo);
            resp = json.toString();
        }catch(Exception ex){
            resp = "Erro "+ex.getMessage();
        }       
        return resp;
    }
    
    public String CarregaEstoqueAtual(){
        String resp;
        try{
            Connection con = Conecta.getConexao();
            JSONObject json = new JSONObject();
            JSONArray arrayItem = new JSONArray();

            PreparedStatement ps;
            ResultSet rs;

            String sql = "SELECT id_item, nome, marca, ti.nome_tipo, (quantidadeTotal-IFNULL(quantidadeReservada,0)) 'qtde', EstoqueMin, EstoqueMax, e.local_fisico " +
                                "FROM item i " +
                                "JOIN estoque e ON i.local_fisico=e.id_local_fisico " +
                                "JOIN tipo_item ti ON i.tipo_item_id_tipo=ti.id_tipo " +
                                "ORDER BY id_item;"; 
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                JSONObject item = new JSONObject();
                item.put("id_item", rs.getInt("id_item"));
                item.put("nome", rs.getString("nome"));
                item.put("marca", rs.getString("marca"));
                item.put("nome_tipo", rs.getString("nome_tipo"));
                item.put("qtde", rs.getString("qtde"));
                item.put("local_fisico", rs.getString("local_fisico"));
                arrayItem.add(item);  
            }
            json.put("item", arrayItem);
            resp = json.toString();
        }catch(Exception ex){
            resp = "Erro "+ex.getMessage();
        }       
        return resp;
    }
    
    public String BuscaEstoqueAtual(String codigo, String descricao, String marca, String tipo_material){
        String resp;
        try{
            Connection con = Conecta.getConexao();
            JSONObject json = new JSONObject();
            JSONArray arrayItem = new JSONArray();

            PreparedStatement ps;
            ResultSet rs;
            
            String where = "";
            
            if(!codigo.equals("")){
                where = "AND id_item = '"+codigo+"'";
            }
            if(!tipo_material.equals("")){
                where += "AND tipo_item_id_tipo = '"+tipo_material+"'";
            }
            
            String sql = "SELECT id_item, nome, marca, ti.nome_tipo, (quantidadeTotal-IFNULL(quantidadeReservada,0)) 'qtde', EstoqueMin, EstoqueMax, e.local_fisico " +
                                "FROM item i " +
                                "JOIN estoque e ON i.local_fisico=e.id_local_fisico " +
                                "JOIN tipo_item ti ON i.tipo_item_id_tipo=ti.id_tipo " +
                                "WHERE (nome LIKE ? AND marca LIKE ?) "+
                                where+"ORDER BY id_item;"; 
            ps = con.prepareStatement(sql);
            
            ps.setString(1, '%'+descricao+'%');
            ps.setString(2, '%'+marca+'%');
            
            rs = ps.executeQuery();
            while(rs.next()){
                JSONObject item = new JSONObject();
                item.put("id_item", rs.getInt("id_item"));
                item.put("nome", rs.getString("nome"));
                item.put("marca", rs.getString("marca"));
                item.put("nome_tipo", rs.getString("nome_tipo"));
                item.put("qtde", rs.getString("qtde"));
                item.put("local_fisico", rs.getString("local_fisico"));
                arrayItem.add(item);  
            }
            json.put("item", arrayItem);
            resp = json.toString();
        }catch(Exception ex){
            resp = "Erro "+ex.getMessage();
        }       
        return resp;
    }
    /*
    public ArrayList<Aluno> getAlunos(){
        ArrayList<Aluno> lista = new ArrayList<>();
        try{
            Connection con = Conecta.getConexao();
            String sql = "SELECT RGM,NOME,NOTA1,NOTA2 FROM DADOS";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Aluno aluno = new Aluno();
                aluno.setNome(rs.getString("nome"));
                aluno.setRgm(rs.getString("rgm"));
                aluno.setNota1(rs.getFloat("nota1"));
                aluno.setNota2(rs.getFloat("nota2"));
                lista.add(aluno);  
            }
        }catch(Exception ex){
            lista = null;
        }
        
        return lista;
    }
    
    public String alterarAluno(Aluno aluno){
        String resp = "";
        try{
            Connection con = Conecta.getConexao();
            String sql = "UPDATE DADOS SET NOME=?, NOTA1=?, NOTA2=? WHERE RGM=?";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, aluno.getNome());
            ps.setFloat(2, aluno.getNota1());
            ps.setFloat(3, aluno.getNota2());
            ps.setString(4, aluno.getRgm());
            
            ps.execute();
            ps.close();
            con.close();
            resp = "Aluno Alterado com Sucesso!!!";
            
        }catch(Exception ex){
            resp = "Erro: " + ex.getMessage();
        }
        return resp;
    }
    
    public String excluirAluno(Aluno aluno){
        String resp = "";
        try{
            Connection con = Conecta.getConexao();
            String sql = "DELETE FROM DADOS WHERE RGM = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, aluno.getRgm());
            
            ps.execute();
            ps.close();
            con.close();
            resp = "Aluno Exclu√≠do com Sucesso!!!";
            
        }catch(Exception ex){
            resp = "Erro: " + ex.getMessage();
        }
        return resp;
    }
    
    public Aluno selecionarAluno(String rgm){
        
        Aluno aluno = new Aluno();
        try{
            Connection con = Conecta.getConexao();
            String sql = "SELECT RGM, NOME, NOTA1, NOTA2 from dados WHERE RGM = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, rgm);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                aluno.setNome(rs.getString("nome"));
                aluno.setNota1(rs.getFloat("nota1"));
                aluno.setNota2(rs.getFloat("nota2"));
            }
            
        }catch(Exception ex){
            aluno = null;
        }
        
        return aluno;
    }

*/
}
