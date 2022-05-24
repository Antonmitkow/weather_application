import 'package:flutter/material.dart';

import 'package:weather_app/model/weather.dart';
import 'package:weather_app/forecast_screen/hourly_widget/weather_card.dart';

class HourlyWeather extends StatelessWidget {
  List<Weather>? hourlyWeather;
  HourlyWeather({
    Key? key,
    this.hourlyWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hourlyWeather!.length,
          itemBuilder: ((context, index) {
            return WeatherCard(
              icon: '${hourlyWeather![index].icon}',
              temperature: '${hourlyWeather![index].temperature}',
              title:
                  '${hourlyWeather![index].time!.hour}:${hourlyWeather![index].time!.minute}',
            );
          })),
    );
  }
}
