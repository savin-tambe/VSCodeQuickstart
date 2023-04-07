public class Car extends Vehicle
{
    public String make;
    public String model;
    public Integer year;
    public Double price;
    
    //Default Constructor
    public Car() 
    {
        super();
        make='Honda';
        model='City';
        year=2010;
        price=123456.5;
    }

    //Parameterized Constructor
    public Car(String type, String RegistrationNumber,  String make,String model, Integer year, Double price ) 
    {
        super(type,RegistrationNumber);
        this.make=make;
        this.model=model;
        this.year=year;
        this.price=price;
    }

    public override String vehicleDetails()
    {
        return '\nType of Vehicle : '+getVehicleType()+',\n Registration Number: '+getRegistrationNumber()+'\n Make of Vehicle: '+make+'\n Model of Vehicle'+model;
    }

    public void displayCarDetails()
    {
        Car car1 = new Car('Four Wheeler','MAH687453','Tata','Safari',2020,214572);
        Car car2 = new Car('Four Wheeler','MP8754212','Audi','Q3',2015,542132);
        Car car3 = new Car('Four Wheeler','TN8745126','Toyota','Fotuner',2012,845213);

        List<Car> carList = new List<Car>();
       
        carList.add(car1);
        carList.add(car2);
        carList.add(car3);

        for(Car carDetails : carList)
        {
            System.debug('\n'+carDetails);
        }
    }
}