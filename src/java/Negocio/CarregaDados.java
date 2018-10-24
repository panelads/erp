package Negocio;

import Dao.Conecta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;
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
                try{
                    Connection con = Conecta.getConexao();
                    String sql = "INSERT INTO item (nome, descricao, preco, marca, quantidadeTotal, EstoqueMin, EstoqueMax, tipo_item_id_tipo)"
                            + " VALUES (?,?,?,?,?,?,?,?)";
                    PreparedStatement pstm = con.prepareStatement(sql);
                    pstm.setString(1, request.getParameter("nome"));
                    pstm.setString(2, request.getParameter("descr"));
                    pstm.setDouble(3, Double.parseDouble(request.getParameter("preco")));
                    pstm.setString(4, request.getParameter("marca"));
                    pstm.setInt(5, Integer.parseInt(request.getParameter("qtde")));
                    pstm.setInt(6, Integer.parseInt(request.getParameter("qtdeMin")));
                    pstm.setInt(7, Integer.parseInt(request.getParameter("qtdeMax")));
                    pstm.setInt(8, Integer.parseInt(request.getParameter("tipo")));

                    pstm.execute(sql);
                    pstm.close();
                    out.print("Sucesso");
                    
                    
                }catch(Exception ex){
                    out.print("Erro "+ex.getMessage());
                }
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
