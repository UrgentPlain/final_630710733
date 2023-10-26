/*"condition": {
"text": "Partly cloudy",
"icon": "https://cdn.weatherapi.com/weather/128x128/day/116.png",
"code": 1003*/
class Condition {
  final String con;


  Condition({
    required this.con,

  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      con: json['con'],

    );
  }
}