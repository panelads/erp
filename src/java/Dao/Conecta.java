package Dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conecta {
    
    public static Connection getConexao() throws Exception{
       Connection con = null;
       String serverName = "127.0.0.1:3306";
       String database = "mydb";
 
       String usuario = "root";
       String senha = "bossme30";
       
       String driverName = "com.mysql.cj.jdbc.Driver";
       Class.forName(driverName);   
       
       String url = "jdbc:mysql://" + serverName + "/" + database + "?useTimezone=true&serverTimezone=UTC"; // a JDBC url
        con = DriverManager.getConnection(url, usuario, senha);
       return con;
        
    }
    
}
