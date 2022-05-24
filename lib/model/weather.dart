class Weather {
  int? temperature;
  int? feelsTemperature;
  String? description;
  int? humidity;
  String? icon;
  DateTime? time;

  Weather({
    this.temperature,
    this.feelsTemperature,
    this.description,
    this.humidity,
    this.icon,
    this.time,
  });

// List<dynamic> hourlyJson = json['list'];
//     List<Weather> hourly = [];
//     for (var item in hourlyJson) {
//       hourly.add(Weather.fromJson(item));
//     }
  Weather.fromJson(Map<String, dynamic> json) {
    temperature =
        double.parse(json['list'][0]['main']['temp'].toString()).toInt();
    feelsTemperature =
        double.parse(json['list'][0]['main']['feels_like'].toString()).toInt();
    description = json['list'][0]['weather'][0]['description'];
    humidity = json['list'][0]['main']['humidity'];
    icon = json['list'][0]['weather'][0]['icon'];
    // time =
    //     DateTime.fromMillisecondsSinceEpoch(json['list'][0]['dt_txt'] * 1000);
  }
}
