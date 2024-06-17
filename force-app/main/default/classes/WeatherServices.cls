public class WeatherServices {

    // Método para hacer una llamada GET a una API REST
    public static HttpResponse getWeatherData(String latitude, String longitude) {
        API_Setting__mdt apiSetting = API_Setting__mdt.getInstance(WeatherConstants.WEATHER_API_CUSTOM_METADATA_DEVELOPER_NAME);
        String apiKey = apiSetting.API_Key__c;
        String parameters = '?key=' + apiKey + '&q=' + latitude + ',' + longitude + '&aqi=no';//'?key=e0eea905125f42f2a75220013241606&q=-9.089000,-78.475641&aqi=no';
        String endpointUrl = 'callout:WeatherAPI';

        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpointUrl + parameters);
        req.setMethod('GET');
        
        req.setHeader('Content-Type', 'application/json');
        
        Http http = new Http();
        HttpResponse res;
        
        try {
            res = http.send(req);
            System.debug(res.getStatusCode());
            System.debug(res.getBody());
        } catch (Exception e) {
            // Manejar excepciones
            System.debug('Error haciendo la solicitud GET: ' + e.getMessage());
            throw e;
        }
        
        return res;
    }
}
