public with sharing class WeatherController {
    public static void saveCurrentWeather(String latitude, String longitude) {
        HttpResponse res = WeatherServices.getWeatherData(latitude, longitude);
        Map<String, Object> wrapper = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        System.debug(wrapper.get('current'));
        Map<String, Object> current = (Map<String, Object>) wrapper.get('current');
        Double temperature = (Double) ((Map<String, Object>) current).get('temp_c');
        Double humidity = (Double) ((Map<String, Object>) current).get('humidity');
        Double windSpeed = (Double) ((Map<String, Object>) current).get('wind_kph');
        Double windDegree = (Double) ((Map<String, Object>) current).get('wind_degree');
        String windDirection = ((Map<String, Object>) current).get('wind_dir').toString();
        Double uv = (Double) ((Map<String, Object>) current).get('uv');
        Datetime dateCollected = WeatherUtils.convertToDateTime(((Map<String, Object>) current).get('last_updated').toString());
        String condition = ((Map<String, Object>) ((Map<String, Object>) current).get('condition')).get('text').toString();
        System.debug(condition);
        System.debug(temperature);
        System.debug(humidity);
        System.debug(windSpeed);
        System.debug(windDegree);
        System.debug(windDirection);
        System.debug(uv);
        System.debug(dateCollected);
    }
}