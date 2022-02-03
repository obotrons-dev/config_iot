import 'dart:convert';
import 'package:ap_config/mainpage/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

const background = Color(0xFFFEF5ED);
const font = Color(0xFF536DFE);
const button = Color(0xFF536DFE);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: button,
    textStyle: const TextStyle(
      fontSize: 20,
    ));

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
        appBar: AppBar(
          backgroundColor: font,
          iconTheme: IconThemeData(color: background),
          elevation: 0,
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [font, background],
          )),
          child: Center(
            child: Column(
              children: [
                Card(
                    margin: EdgeInsets.all(30),
                    child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        "Config Wifi",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'RobotoMono',
                            color: font),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        width: 300,
                        child: TextField(
                          controller: wifi_ssid,
                          decoration: InputDecoration(
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
                            hintText: 'password',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: style,
                        onPressed: () {
                          sendData();
                        },
                        child: Text("submit"),
                      ),
                    ],
                  ),
                ))
              ],
            ),
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
    await EasyLoading.show(status: 'loading...');
    if (wifi_ssid.text.length > 0 && passwords.text.length > 0) {
      var senddata = {
        "local": "no",
        "config": this.widget.data,
        "wifi": {"ssid": wifi_ssid.text, "wifi_password": passwords.text}
      };
      String json = jsonEncode(senddata);
      var url = "http://192.168.4.11/loadConfig?data=${json}";
      var response = await http.get(Uri.parse(url));
      String jsonResponse = response.body;

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeApp()));
        EasyLoading.showSuccess("success");
      }
    } else {
      EasyLoading.showError("Please check your wifi");
    }
  }
}
