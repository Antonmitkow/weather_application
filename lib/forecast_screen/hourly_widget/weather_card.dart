import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final double height;
  final String title;
  final String temperature;
  final String icon;

  const WeatherCard(
      {Key? key,
      this.height = 50,
      required this.title,
      required this.temperature,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height,
              width: 41,
              color: Colors.green,
              child: Text(
                '$temperature°',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(title),
            ),
            Image.network(
              "http://openweathermap.org/img/wn/$icon@2x.png",
              height: 15,
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
