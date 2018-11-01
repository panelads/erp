package Negocio;

import Basic.NovoItem;
import Dao.Conecta;
import Dao.Dados;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet(urlPatterns = {"/CarregaDados"})
public class CarregaDados extends HttpServlet {
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            //recuperar informação que iremos submeter
            String opcao = request.getParameter("opcao");

            if(opcao.equals("novo-item")){
                Connection con = Conecta.getConexao();
                String sql = "SELECT id_tipo, nome_tipo FROM tipo_item ORDER BY nome_tipo";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                JSONObject json = new JSONObject();
                JSONArray array = new JSONArray();
                while(rs.next()){
                    JSONObject item = new JSONObject();
                    item.put("id", rs.getInt("id_tipo"));
                    item.put("nome", rs.getString("nome_tipo"));
                    array.add(item);  
                }
                json.put("dados", array);
                out.print(json);
            }
            else if(opcao.equals("grava-item")){
                NovoItem item = new NovoItem();
                item.setNome(request.getParameter("nome"));
                item.setMarca(request.getParameter("marca"));
                item.setDescricao(request.getParameter("descr"));
                item.setPreco(Double.parseDouble(request.getParameter("preco").replace(".", "").replace(",",".")));
                item.setQtde(Integer.parseInt(request.getParameter("qtde")));
                item.setQtdeMin(Integer.parseInt(request.getParameter("qtdeMin")));
                item.setQtdeMax(Integer.parseInt(request.getParameter("qtdeMax")));
                item.setTipo(Integer.parseInt(request.getParameter("tipo")));
                Dados dados = new Dados();
                out.print(dados.inserirNovoItem(item));
                
                /*
                try{
                    Double preco = Double.parseDouble(request.getParameter("preco"));
                    int qtde = Integer.parseInt(request.getParameter("qtde"));
                    int qtdeMin = Integer.parseInt(request.getParameter("qtdeMin"));
                    int qtdeMax = Integer.parseInt(request.getParameter("qtdeMax"));
                    int tipo = Integer.parseInt(request.getParameter("tipo"));
                    
                    Connection con = Conecta.getConexao();
                    String sql = "INSERT INTO item (nome, descricao, preco, marca, quantidadeTotal, EstoqueMin, EstoqueMax, tipo_item_id_tipo) VALUES (?,?,?,?,?,?,?,?)";
                    PreparedStatement pstm = con.prepareStatement(sql);
                    
                    pstm.setString(1, nome);
                    pstm.setString(2, descr);
                    pstm.setDouble(3, preco);
                    pstm.setString(4, marca);
                    pstm.setInt(5, qtde);
                    pstm.setInt(6, qtdeMin);
                    pstm.setInt(7, qtdeMax);
                    pstm.setInt(8, tipo);

                    pstm.execute(sql);
                    pstm.close();
                    out.print(request.getParameter("nome"));
                    
                    
                }catch(Exception ex){
                    out.print("Erro "+ex.getMessage());
                }
                */
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CarregaDados.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CarregaDados.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
