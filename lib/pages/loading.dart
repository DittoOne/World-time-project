import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:another_baikka_project/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
  /* void getTime() async {
   try{
    /* final Uri url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
     await Future.delayed(Duration(seconds: 2));
     Response response = await get(url);
     Map<String,dynamic> data = json.decode(response.body);

     print(data["title"]+" "+data['userId'].toString()+" "+data["id"].toString());*/
    /* var headers = {
       'X-RapidAPI-Key': '386d354f6dmsh86c78ca9a27d4f6p1ef2e8jsn41bbc0d8d92d',
       'X-RapidAPI-Host': 'world-time-by-api-ninjas.p.rapidapi.com',
     };
     var url = Uri.parse('https://world-time-by-api-ninjas.p.rapidapi.com/v1/worldtime?city=London');
     var response = await get(url, headers: headers);

     if (response.statusCode == 200) {
       var jsonResponse = json.decode(response.body);
       Map<String,dynamic> data = jsonResponse;
       print(jsonResponse);
       print("${data["timezone"]}  ${data["datetime"]}  "
           " ${data["date"]}"
           " ${data["year"]}");
     } else {
       throw Exception('Failed to load data');
     }*/
     final Uri url = Uri.parse("https://worldtimeapi.org/api/timezone/europe/Athens");
     await Future.delayed(Duration(seconds: 2));
     Response response = await get(url);
     Map<String,dynamic> data = json.decode(response.body);
     print(response.body);

     String dateTime = data['datetime'];
     String offset = data['utc_offset'].substring(1,3);

     DateTime now =DateTime.parse(dateTime);
     now = now.add(Duration(hours: int.parse(offset)));
     print(now);


   }catch(e){
     print(e);
    }

  }*/
  void setupWorldTime() async {

    WorldTime wt = WorldTime(
        location: "Dhaka", flag: "germany.png", url: "asia/Dhaka");
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home',
        arguments: {
      'location': wt.location,
          'time': wt.time,
          'flag': wt.flag,
          'isDaytime':wt.isDaytime
    });
    print(wt.time);
    setState(() {
      time = wt.time;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();

    // print('data: ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          duration: Duration(milliseconds: 1000),
        )
      )
    );
  }
}
