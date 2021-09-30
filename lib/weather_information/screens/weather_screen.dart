import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});

  final dynamic parseWeatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityName;
  int temp;
  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    temp = temp2.round();
    cityName = weatherData['name'];

    print(temp);
    print(cityName);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true, // appbar 색을 바디색과 동일하게 하기 위한 것
        appBar: AppBar(
          //title: Text(''),
          backgroundColor: Colors.transparent, // appbar 색을 바디색과 동일하게 하기 위한 것
          elevation: 0.0, // appbar 색을 바디색과 동일하게 하기 위한 것
          leading: IconButton(
              icon: Icon(Icons.near_me), onPressed: () {}, iconSize: 30.0),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.location_searching,
                ),
                onPressed: () {},
                iconSize: 30.0)
          ],
        ),
        body: Container(
          child: Stack(
            children: [
              Image.asset(
                'lib/weather_information/image/background.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150.0,
                              ),
                              Text(
                                '$cityName',
                                style: GoogleFonts.lato(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  TimerBuilder.periodic(
                                    (Duration(minutes: 1)),
                                    builder: (context) {
                                      print('${getSystemTime()}');
                                      return Text(
                                        '${getSystemTime()}',
                                        style: GoogleFonts.lato(
                                            fontSize: 16.0,
                                            color: Colors.white),
                                      );
                                    },
                                  ),
                                  Text(DateFormat(' - EEEE, ').format(date),
                                      style: GoogleFonts.lato(
                                          fontSize: 16.0, color: Colors.white)),
                                  Text(DateFormat('d MMM, yyy').format(date),
                                      style: GoogleFonts.lato(
                                          fontSize: 16.0, color: Colors.white))
                                ], //children
                              )
                            ], //children
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '18\u2103',
                                style: GoogleFonts.lato(
                                    fontSize: 85.0,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'lib/weather_information/svg/Cloud-Sun.svg'),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'cloud sky',
                                    style: GoogleFonts.lato(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ], // children
                          ),
                        ], //children
                      ),
                    ),
                    Column(
                      children: [
                        Divider(
                          height: 15.0,
                          thickness: 2.0,
                          color: Colors.white30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(                      // 첫번째 컬럼
                              children: [
                                Text(
                                  'AQI(대기질지수)',
                                  style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Image.asset(
                                  'lib/weather_information/image/bad.png',
                                  width: 37.0,
                                  height: 35.0,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  '"매우나쁨"',
                                  style: GoogleFonts.lato(
                                      fontSize: 14.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(                         // 두번째 컬럼
                              children: [
                                Text(
                                  '미세먼지',
                                  style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  '174.75',
                                  style: GoogleFonts.lato(
                                    fontSize: 24.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'μg/m3',
                                  style: GoogleFonts.lato(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(                       // 세번째 컬럼
                              children: [
                                Text(
                                  '초미세먼지',
                                  style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  '84.03',
                                  style: GoogleFonts.lato(
                                    fontSize: 24.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'μg/m3',
                                  style: GoogleFonts.lato(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 70), // 메인 프레임의 하단 박스(배너자리)에 가려서 공간을
                        // 확보하기 이해 SizeBox를 넣었음.
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}