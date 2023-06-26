package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class MySqlDBConexion{

    // Permite el acceso a los parámetros del archivo properties
    private static ResourceBundle rb = ResourceBundle.getBundle("database");

    // Accede a las clases del sqljdbcXXXX.jar
    static {
        try {
            Class.forName(rb.getString("driver"));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Método para crear conexiones
    public static Connection getConexion() {
        Connection salida = null;
        try {
            salida = DriverManager.getConnection(
                    rb.getString("url"),
                    rb.getString("username"),
                    rb.getString("password"));

            if (salida != null && !salida.isClosed()) {
                System.out.println("¡Conexión exitosa a la base de datos SQL Server!");
            } else {
                System.out.println("La conexión a la base de datos SQL Server ha fallado.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return salida;
    }
}
