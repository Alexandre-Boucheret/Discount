/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.*;
import javax.sql.DataSource;

/**
 *
 * @author aboucher
 */
public class DAO {

    protected final DataSource datasource;
    
    public DAO(DataSource datasource) {
        this.datasource = datasource;
    }
    
    public List<DiscountCode> listCode(){
        List<DiscountCode> liste = new ArrayList<>();
        String sql = "SELECT * FROM DISCOUNT_CODE";
   
        try(Connection connection = datasource.getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql)
            ) {
            while(rs.next()){
                liste.add(new DiscountCode(rs.getString("DISCOUNT_Code"), rs.getFloat("RATE")));
            }
            
        } catch (SQLException e) {
            Logger.getLogger("DAO").log(Level.SEVERE, null, e);
        }
        return liste;
    }
    
    public void insertCode(String code, float rate){
        String sql = "INSERT INTO DISCOUNT_CODE (DISCOUNT_CODE,RATE) VALUES (?,?)";
        try (Connection connection = datasource.getConnection();
            PreparedStatement stmt = connection.prepareStatement(sql)
            ) {
            stmt.setString(1, code);
            stmt.setFloat(2, rate);
            
            stmt.executeUpdate();
            
        } catch (SQLException e) {
            Logger.getLogger("DAO").log(Level.SEVERE, null, e);
        }
    }
    
    public void deleteCode(String code){
        String sql = "DELETE FROM DISCOUNT_CODE WHERE DISCOUNT_CODE = ? ";
        try (Connection connection = datasource.getConnection();
            PreparedStatement stmt = connection.prepareStatement(sql)
            ) {
            stmt.setString(1, code);
            
            stmt.executeUpdate();
            
        } catch (SQLException e) {
            Logger.getLogger("DAO").log(Level.SEVERE, null, e);
        }
    }
}
