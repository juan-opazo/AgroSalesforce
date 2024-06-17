public with sharing class WeatherUtils {

    public static Datetime convertToDateTime(String dateTimeString) {
        // Extract date and time parts
        List<String> parts = dateTimeString.split(' ');
        String datePart = parts[0];
        String timePart = parts[1];
        
        // Extract year, month, day from date part
        List<String> dateComponents = datePart.split('-');
        Integer year = Integer.valueOf(dateComponents[0]);
        Integer month = Integer.valueOf(dateComponents[1]);
        Integer day = Integer.valueOf(dateComponents[2]);
        
        // Extract hour and minute from time part
        List<String> timeComponents = timePart.split(':');
        Integer hour = Integer.valueOf(timeComponents[0]);
        Integer minute = Integer.valueOf(timeComponents[1]);
        System.debug('hour: ' + hour);
        System.debug('minute: ' + minute);
        // Create Date and Time objects
        Date newDate = Date.newInstance(year, month, day);
        Time newTime = Time.newInstance(hour, minute, 0, 0);
        System.debug(newTime);
        // Combine into Datetime
        Datetime newDateTime = Datetime.newInstance(newDate, newTime);
        
        return newDateTime;
    }

    public class WeatherWrapper {
        @AuraEnabled public String condition { get; set; }
        @AuraEnabled public Datetime dateCollected { get; set; }
        @AuraEnabled public Double humidity { get; set; }
        @AuraEnabled public Double temperature { get; set; }
        @AuraEnabled public Double uv { get; set; }
        @AuraEnabled public Double windDegree { get; set; }
        @AuraEnabled public String windDirection { get; set; }
        @AuraEnabled public Double windSpeed { get; set; }
        
    }
}