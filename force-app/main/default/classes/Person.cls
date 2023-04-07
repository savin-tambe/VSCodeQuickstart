// Defining a class called 'Person'
public virtual class Person {
    // Defining private instance variables
    private String name;
    private Integer age;
    
    // Defining a constructor to initialize the instance variables
    public Person(String name, Integer age) {
        this.name = name;
        this.age = age;
    }
    
    // Defining public getter and setter methods for the instance variables
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public Integer getAge() {
        return this.age;
    }
    
    public void setAge(Integer age) {
        this.age = age;
    }
    
    // Defining a public method called 'greet' that returns a string
    public String greet() {
        return 'Hello, my name is ' + this.name + ' and I am ' + this.age + ' years old.';
    }
    
    // Defining a static method called 'isAdult' that returns a boolean value
    public static Boolean isAdult(Integer age) {
        return age >= 18;
    }
}