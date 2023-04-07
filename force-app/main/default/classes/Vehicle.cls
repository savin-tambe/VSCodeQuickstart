public Virtual class Vehicle 
{
    private String vehicleType;
    private String registrationNumber;

    public Vehicle() 
    {
        vehicleType='Bike';
        registrationNumber='KA875421';
    }

    public Vehicle(String vehicleType, String registrationNumber)
    {
        this.vehicleType=vehicleType;
        this.registrationNumber=registrationNumber;
    }

    public String getVehicleType()
    {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType)
    {
        this.vehicleType=vehicleType;
    }

    public String getRegistrationNumber()
    {
        return registrationNumber;
    }

    public void setRegistrationNumber(String RegistrationNumber)
    {
        this.RegistrationNumber=RegistrationNumber;
    }

    public virtual String vehicleDetails()
    {
        return 'Type of Vehicle : '+vehicleType+', Registration Number: '+registrationNumber;
    }
}