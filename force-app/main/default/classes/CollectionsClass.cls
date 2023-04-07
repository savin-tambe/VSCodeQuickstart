public with sharing class CollectionsClass {

    public CollectionsClass() {

    }

    public void DisplayList()
    {
        List<String> listName = new List<String>();
        listName.add('Savin');
        listName.add('Sanjay');
        listName.add('Tambe');
        System.debug('----------------------List---------------------');
        for(String name : listName)
        {
            System.debug(name);
        }

        //List to Set
        System.debug('----------------------List to Set---------------------');
        Set<String> setOfStrings = new Set<String>(listName);
        System.debug(setOfStrings);

    }

    public void DisplaySet()
    {
        Set<Integer> setNumbers = new Set<Integer>();

        setNumbers.add(1);
        setNumbers.add(2);
        setNumbers.add(2);
        setNumbers.add(4);
        System.debug('----------------------Set---------------------');
        for(Integer num : setNumbers)
        {
            System.debug(num);
        }

        //Set to List
        System.debug('----------------------Set To List---------------------');
        List<Integer> listOfIntegers = new List<Integer>(setNumbers);
        System.debug(listOfIntegers);

    }

    public void DisplayMap()
    {
        Map<Integer, String> mapName = new Map<Integer, String>();

        mapName.put(1, 'Pratik');
        mapName.put(2, 'Pooja');
        mapName.put(3, 'Akshay');
        mapName.put(4, 'Harshavardhan');
        
        System.debug('----------------------Map---------------------');
        for( Integer id : mapName.keySet())
        {
            System.debug('Id: '+id+' Name: '+mapName.get(id));
        }

       //map to List
       System.debug('----------------------Map To List---------------------');
       List<String> listToMap = new List<String>(mapName.values());
       System.debug(listToMap);

       System.debug('----------------------Map To Set---------------------');
       Set<Integer> setToMap = new Set<Integer>(mapName.keySet());
       System.debug(setToMap);
    }

    
}