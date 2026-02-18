public class ParkLocator{
    public static List<String> country(String country){
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        List<String> parksName = parks.byCountry(country);
        return parksName;
    }
}