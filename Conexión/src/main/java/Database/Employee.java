/* Class to store information related to an Employee
 * Stores the name and the salary
 */

// Armando Castro, Stephanie Sandoval
// Mar 09. 24

package Database;

public class Employee {
    private String name;
    private double salary;

    public Employee (String name, double salary){
        this.name = name;
        this.salary = salary;
    }

    public void setName (String name){
        this.name = name;
    }

    public void setSalary (double salary){
        if (salary > 0){
            this.salary = salary;
        }
    }

    public String getName (){
        return this.name;
    }

    public double getSalary (){
        return this.salary;
    }
}
