/* Class to connect with the database
 * Allows writing and reading operations
 * Works with singleton pattern
 */

// Armando Castro, Stephanie Sandoval
// Mar 09. 24

package Database;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;

public class EmployeeRepository {
    private String connectionString;
    private static EmployeeRepository instance;
    private Connection connection;
    private CallableStatement callableStatement;

    private EmployeeRepository (){
        this.connectionString = "jdbc:sqlserver://progra-server.database.windows.net:1433;"
        + "database=PrograDB;user=progra-admin@progra-server;password=ba$e1234;"
        + "encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;"
        + "loginTimeout=30;";
    }

    /* ------------------------------------------------------------ */
    // get the instance of the class

    public static synchronized EmployeeRepository getInstance (){
        if (instance == null){
            instance = new EmployeeRepository();
        }
        return instance;
    }

    /* ------------------------------------------------------------ */
    // write data to the database with the corresponding sp
    // returns the result code of the operation
    // possible results: 0 success, 50010 repeated info, error otherwise

    public int writeData (String name, double salary){
        int resultCode = -1;
        try {
            connection = DriverManager.getConnection(connectionString);

            // prepare call for the stored procedure
            String insertSPCall = "{CALL dbo.InsertarEmpleado (?, ?, ?)}";
            callableStatement = connection.prepareCall(insertSPCall);

            // prepare the input parameters
            callableStatement.setString(1, name);
            callableStatement.setDouble(2, salary);

            // prepare the ouput parameters
            callableStatement.registerOutParameter(3, Types.INTEGER);

            // execute the stored procedure and get result
            callableStatement.execute();
            resultCode = callableStatement.getInt(3);

        } catch (Exception exception){

        } finally {
            try {
                if (callableStatement != null){
                    callableStatement.close();
                }
                if (connection != null){
                    connection.close();
                }
            } catch (Exception exception){}
        }
        return resultCode;
    }

    /* ------------------------------------------------------------ */
    // read data from the database with the corresponding sp
    // returns the data list as an arraylist of employees

    public ArrayList<Employee> readData (){
        ArrayList<Employee> employeeList = new ArrayList<>();

        try {
            connection = DriverManager.getConnection(connectionString);

            // prepare call for the stored procedure
            String storedProcedureCall = "{CALL dbo.ListarEmpleado}";
            callableStatement = connection.prepareCall(storedProcedureCall);

            // execute the stored procedure and get result
            callableStatement.execute();
            ResultSet resultSet = callableStatement.getResultSet();

            // store the values
            while (resultSet.next()){
                String name = resultSet.getString("Nombre");
                double salary = resultSet.getDouble("Salario");
                employeeList.add(new Employee(name, salary));
            }
        } catch (Exception exception){

        } finally {
            try {
                if (callableStatement != null) {
                    callableStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {}
        }

        return employeeList;
    } 
}