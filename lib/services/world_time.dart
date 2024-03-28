import 'dart:core';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDaytime;

  WorldTime({required this.location,required this.flag,required this.url});
 Future<void> getTime() async {
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
      final Uri urla = Uri.parse("https://worldtimeapi.org/api/timezone/$url");
      await Future.delayed(Duration(seconds: 2));
      Response response = await get(urla);
      Map<String,dynamic> data = json.decode(response.body);
      print(response.body);

      String dateTime = data['datetime'];
      print( data['datetime']);
      //print(dateTime);
      String offset = data['utc_offset'].substring(1,3);

      DateTime now =DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
     // print(now);
      isDaytime = now.hour > 6 && now.hour < 20 ? true:false;
      time = DateFormat.jm().format(now);


    }catch(e){
      print(e);
    }

  }

}