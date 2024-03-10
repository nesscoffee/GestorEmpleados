// Armando Castro, Stephanie Sandoval | Mar 12. 24
// Tarea Programada 01 | Base de Datos I

/* Driver class of the project
 * Used to test the code
 */

package Main;

import java.util.ArrayList;

import Database.Employee;
import Database.EmployeeRepository;

public class Main {
    public static void main(String[] args) {
        EmployeeRepository repository = EmployeeRepository.getInstance();

        int result = repository.writeData("Sofia Hernandez", 65000);
        System.out.println(result);

        ArrayList<Employee> employeeList = new ArrayList<>();
        employeeList = repository.readData();
        for (Employee employee : employeeList){
            System.out.printf("%2d. Name: %-20s | Salary: %.2f%n", employeeList.indexOf(employee)+1, 
            employee.getName(), employee.getSalary());
        }
    }
}