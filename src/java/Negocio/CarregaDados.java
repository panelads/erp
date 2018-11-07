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
            Dados dados = new Dados();

            if(opcao.equals("novo-item")){
                out.print(dados.CarregaTipo());
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
                item.setLocalFisico(Integer.parseInt(request.getParameter("local_fisico")));
                out.print(dados.inserirNovoItem(item));
            }
            else if(opcao.equals("grava-tipo-material")){
                String tipo_material = request.getParameter("tipo_material");
                out.print(dados.inserirTipoMaterial(tipo_material));
            }
            else if(opcao.equals("exclui-tipo-material")){
                int id = Integer.parseInt(request.getParameter("id"));
                out.print(dados.excluirTipoMaterial(id));
            }
            else if(opcao.equals("estoque-atual")){
                out.print(dados.CarregaEstoqueAtual());
            }
            else if(opcao.equals("busca-estoque-atual")){
                String codigo = request.getParameter("codigo");
                String descricao = request.getParameter("descricao");
                String marca = request.getParameter("marca");
                String tipo_material = request.getParameter("tipo_material");
                out.print(dados.BuscaEstoqueAtual(codigo, descricao, marca, tipo_material));
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
