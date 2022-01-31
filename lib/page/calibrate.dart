import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const background = Color(0xFFFEF5ED);
const font = Color(0xFF99A799);
const button = Color(0xFF99A799);
final ButtonStyle style =
ElevatedButton.styleFrom(primary: button,textStyle: const TextStyle(fontSize: 20,));

class Calibrate extends StatefulWidget {
  final dynamic snapshot;
  Calibrate(this.snapshot);

  @override
  _CalibrateState createState() => _CalibrateState();
}

class _CalibrateState extends State<Calibrate> {

  TextEditingController off_pm1;
  TextEditingController off_pm2_5;
  TextEditingController off_pm10;
  TextEditingController off_co2;
  TextEditingController off_tvoc;
  TextEditingController off_temp;
  TextEditingController off_humid;
  TextEditingController scale_pm1;
  TextEditingController scale_pm2_5;
  TextEditingController scale_pm10;
  TextEditingController scale_co2;
  TextEditingController scale_tvoc;
  TextEditingController scale_temp;
  TextEditingController scale_humid;


  void initState() {
    super.initState();
    off_pm1 = new TextEditingController();
    off_pm2_5 = new TextEditingController();
    off_pm10 = new TextEditingController();
    off_co2 = new TextEditingController();
    off_tvoc = new TextEditingController();
    off_temp = new TextEditingController();
    off_humid = new TextEditingController();
    scale_pm1 = new TextEditingController();
    scale_pm2_5 = new TextEditingController();
    scale_pm10 = new TextEditingController();
    scale_co2 = new TextEditingController();
    scale_tvoc = new TextEditingController();
    scale_temp = new TextEditingController();
    scale_humid = new TextEditingController();

  }


  loadCalibrate () async{
    var calibrate = {"calibrate":{
      "pm1": {"offset":off_pm1.text,"scale":scale_pm1.text},
      "pm2.5": {"offset":off_pm2_5.text,"scale":scale_pm2_5.text},
      "pm10": {"offset":off_pm10.text,"scale":scale_pm10.text},
      "co2": {"offset":off_co2.text,"scale":scale_co2.text},
      "tvoc": {"offset":off_tvoc.text,"scale":scale_tvoc.text},
      "temp": {"offset":off_temp.text,"scale":scale_temp.text},
      "humid": {"offset":off_humid.text,"scale":scale_humid.text}
      }};
    String json = jsonEncode(calibrate);
    var url = "http://${widget.snapshot.data.hWIP}/loadCalibrate?data=${json}";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode ==200){
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text("Calibrate",style: TextStyle(color:font)),
        iconTheme: IconThemeData(color: font),
        elevation: 0,
        backgroundColor: background,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('PM1'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 120.0,
                        child :Form(
                          autovalidateMode:AutovalidateMode.always,
                          child: TextFormField(
                            controller: off_pm1,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                              ),
                              labelText: 'offset',
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    width: 120.0,
                    child :Form(
                      autovalidateMode:AutovalidateMode.always,
                      child: TextFormField(
                        controller: scale_pm1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'scale',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('PM2.5'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 120.0,
                        child :Form(
                          autovalidateMode:AutovalidateMode.always,
                          child: TextFormField(
                            controller: off_pm2_5,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                              ),
                              labelText: 'offset',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 120.0,
                    child :Form(
                      autovalidateMode:AutovalidateMode.always,
                      child: TextFormField(
                        controller: scale_pm2_5,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'scale',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('PM10'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 120.0,
                        child :Form(
                          autovalidateMode:AutovalidateMode.always,
                          child: TextFormField(
                            controller: off_pm10,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                              ),
                              labelText: 'offset',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 120.0,
                    child :Form(
                      autovalidateMode:AutovalidateMode.always,
                      child: TextFormField(
                        controller: scale_pm10,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'scale',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('Co2'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 120.0,
                        child :Form(
                          autovalidateMode:AutovalidateMode.always,
                          child: TextFormField(
                            controller: off_co2,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                              ),
                              labelText: 'offset',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 120.0,
                    child :Form(
                      autovalidateMode:AutovalidateMode.always,
                      child: TextFormField(
                        controller: scale_co2,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'scale',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('TVOC'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 120.0,
                        child :Form(
                          autovalidateMode:AutovalidateMode.always,
                          child: TextFormField(
                            controller: off_tvoc,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                              ),
                              labelText: 'offset',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 120.0,
                    child :Form(
                      autovalidateMode:AutovalidateMode.always,
                      child: TextFormField(
                        controller: scale_tvoc,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'scale',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('Temp'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 120.0,
                        child :Form(
                          autovalidateMode:AutovalidateMode.always,
                          child: TextFormField(
                            controller: off_temp,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                              ),
                              labelText: 'offset',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 120.0,
                    child :Form(
                      autovalidateMode:AutovalidateMode.always,
                      child: TextFormField(
                        controller: scale_temp,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'offset',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('Humid'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 120.0,
                        child :Form(
                          autovalidateMode:AutovalidateMode.always,
                          child: TextFormField(
                            controller: off_humid,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                              ),
                              labelText: 'offset',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 120.0,
                    child :Form(
                      autovalidateMode:AutovalidateMode.always,
                      child: TextFormField(
                        controller: scale_humid,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'scale',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.all(8),
                child:ElevatedButton(onPressed: (){
                  loadCalibrate();
                }, child: Text("loadCalibrate"),
                  style: style,)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
