import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic>? data;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map<String, dynamic>) {
      if (data != null) {
        data = data;
      } else {
        data = args;
      }
      print(data);
    } else {
      print("could not find data");
      data = null;
    }
    String bgImage = data?['isDaytime'] ? 'daytime.jpg' : 'nightime.jpg';
    print(bgImage);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(

        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[

                Text(
                  'Hello User',
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result != null){
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                      });
                    }
                  },
                  icon: Icon(
                  Icons.edit_location,
                  color: Colors.black,
                ),
                  label:  Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "${data?["location"]}",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${data?["time"]}",
                  style: TextStyle(
                      fontSize: 66,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
