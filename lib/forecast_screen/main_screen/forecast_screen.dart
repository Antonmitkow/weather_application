import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/services/weather_api.dart';
import 'package:weather_app/styles/styles.dart';

class ForecastScreenWidget extends StatefulWidget {
  const ForecastScreenWidget({Key? key}) : super(key: key);

  @override
  State<ForecastScreenWidget> createState() => _ForecastScreenWidgetState();
}

class _ForecastScreenWidgetState extends State<ForecastScreenWidget> {
  WeatherApi getLocation = WeatherApi();
  Weather? data;
  List<Weather>? hourlyWeather;

  Future<void> getData() async {
    data = await getLocation.getCurrentWeather('Omsk');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Right now',
                      style: titleTextStyle,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      '${data!.description} for the hours. ',
                      style: descriptionTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Text(
                      '19-27mph winds from the southwest.',
                      style: descriptionTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 6, right: 6, bottom: 6),
                          child: Image.network(
                            'http://openweathermap.org/img/wn/${data!.icon}@2x.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Column(
                          children: [
                            Text('${data!.temperature}°',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 38,
                                    fontWeight: FontWeight.w800)),
                            Text('Feels like ${data!.feelsTemperature}°',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'This afternoon',
                      style: titleTextStyle,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Mostly ${data!.description}',
                      style: descriptionTextStyle,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'This week',
                          style: titleTextStyle,
                        ),
                        Text(
                          'Rain throughout the week, with highs in the 80° all week.',
                          style: descriptionTextStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    // HourlyWeather(hourlyWeather: hourlyWeather),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
