// Defining a subclass called 'Student' that extends the 'Person' class
public class Student extends Person {
    // Defining a private instance variable
    private String major;
    
    // Defining a constructor to initialize the instance variables
    public Student(String name, Integer age, String major) {
        super(name, age);
        this.major = major;
    }
    
    // Defining a public getter and setter method for the instance variable
    public String getMajor() {
        return this.major;
    }
    
    public void setMajor(String major) {
        this.major = major;
    }
    
    // Overriding the 'greet' method from the superclass
    // public String greet() {
    //     return 'Hello, my name is ' + this.getName() + ', I am ' + this.getAge() + ' years old, and my major is ' + this.major + '.';
    // }
}