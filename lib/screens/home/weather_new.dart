import 'package:flutter/material.dart';
import 'package:final_630710733/models/weather.dart';

class WeatherListItem extends StatelessWidget {

  final Weather weather;

  const WeatherListItem({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              color: colorScheme.background,
              child: Center(child: Icon(Icons.home, size: 30.0)),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(weather.city, style: textTheme.headline6),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Temperature: ${weather.tempC}°C'),
                Text('Feels like: ${weather.feelsLikeC}°C'),
                Text('Humidity: ${weather.humidity}%'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
