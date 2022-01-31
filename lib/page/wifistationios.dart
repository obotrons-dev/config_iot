import 'dart:convert';
import 'package:ap_config/mainpage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:http/http.dart' as http;

const background = Color(0xFFFEF5ED);
const font = Color(0xFF99A799);
const button = Color(0xFF99A799);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: button, textStyle: const TextStyle(fontSize: 20, color: font));

final snackBar = SnackBar(
  content: Container(
    height: 30,
    padding: EdgeInsets.only(top: 5),
    child: Text(
      'copy to clipboard ',
      style: TextStyle(color: font, fontSize: 14),
      textAlign: TextAlign.center,
    ),
  ),
  duration: const Duration(milliseconds: 1500),
  padding: const EdgeInsets.symmetric(
    horizontal: 8.0, // Inner padding for SnackBar content.
  ),
  width: 200,
  backgroundColor: background,
  behavior: SnackBarBehavior.floating,
);

class WifiStationIOS extends StatefulWidget {
  final dynamic data;
  WifiStationIOS(this.data);

  @override
  _WifiStationIOSState createState() => _WifiStationIOSState();
}

class _WifiStationIOSState extends State<WifiStationIOS> {
  TextEditingController wifi_ssid;
  TextEditingController passwords;

  @override
  Widget build(BuildContext poContext) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          iconTheme: IconThemeData(color: font),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              Text("Config Wifi"   ,style: TextStyle(fontSize: 20,fontFamily: 'RobotoMono', color: font),),
              SizedBox(height: 20,),
              SizedBox(
                height: 60,
                width: 300,
                child: TextField(
                  controller: wifi_ssid,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ssid',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 60,
                width: 300,
                child: TextField(
                  controller: passwords,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: style,
                onPressed:(){
                  sendData();
                },
                child:Text("submit"),
              ),
            ],
          ),
        ));
  }

  String ssid = "";

  @override
  initState() {
    wifi_ssid = new TextEditingController();
    passwords = new TextEditingController();
    super.initState();
  }

  Future sendData() async {
    if (wifi_ssid.text.length > 0 && passwords.text.length > 0) {
      var senddata = {
        "local":"no",
        "config": this.widget.data,
        "wifi": {"ssid": wifi_ssid.text, "wifi_password": passwords.text}
      };
      String json = jsonEncode(senddata);
      var url = "http://192.168.4.11/loadConfig?data=${json}";
      var response = await http.get(Uri.parse(url));
      String jsonResponse = response.body;

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Container(
            height: 30,
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "SendData Complete",
              style: TextStyle(color: background, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          duration: const Duration(milliseconds: 2000),
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0, // Inner padding for SnackBar content.
          ),
          width: 250,
          backgroundColor: font,
          behavior: SnackBarBehavior.floating,
        ));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeApp()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          height: 30,
          padding: EdgeInsets.only(top: 5),
          child: Text(
            "Pleas Input ssid&password",
            style: TextStyle(color: background, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
        duration: const Duration(milliseconds: 2000),
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0, // Inner padding for SnackBar content.
        ),
        width: 250,
        backgroundColor: Colors.red[400],
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
