import 'dart:convert';
import 'package:ap_config/mainpage/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';


const background = Color(0xFFC1DEAE);
const write = Color(0xFFFAFAFA);
const button = Color(0xFF536DFE);
const grey = Color(0xFF616161);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: background,
    textStyle: textstyle);
const textstyle =
TextStyle(color: grey, fontSize: 20, fontFamily: 'RobotoMono');


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
          backgroundColor: background,
          iconTheme: IconThemeData(color: write),
          elevation: 0,
        ),
        body: Container(
          height: double.infinity,color: background,
          child: Center(
            child: Column(
              children: [
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
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
                            color: grey),
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
