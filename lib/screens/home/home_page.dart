import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:final_630710733/screens/home/weather_new.dart';
import 'package:flutter/material.dart';
import 'package:final_630710733/models/weather.dart';
import 'package:final_630710733/repositories/weather_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Weather>? _weather;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  Future<void> getWeather() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      var weather = await WeatherRepository().getWeathers();
      debugPrint(': ${weather.length}');

      setState(() {
        _weather = weather;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget buildLoadingOverlay() => Container(
    color: Colors.black.withOpacity(0.2),
    child: Center(child: CircularProgressIndicator()),
  );

  Widget buildError() => Center(
    child: Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_errorMessage ?? '', textAlign: TextAlign.center),
          SizedBox(height: 32.0),
          ElevatedButton(onPressed: getWeather, child: Text('ลองใหม่')),
        ],
      ),
    ),
  );

  Widget buildList() => ListView.builder(
    itemCount: _weather!.length,
    itemBuilder: (ctx, i) {
      Weather weather = _weather![i];
      return WeatherListItem(weather: weather);
    },
  );

  void handleClickAdd() {
    // เพิ่มฟังก์ชันที่นี่
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สภาพอากาศ'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickAdd,
        child: Icon(Icons.add),
      ),
      body: Stack(
        children: [
          if (_weather?.isNotEmpty ?? false) buildList(),
          if (_errorMessage != null) buildError(),
          if (_isLoading) buildLoadingOverlay(),
        ],
      ),
    );
  }
}
