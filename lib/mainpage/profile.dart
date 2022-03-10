import 'dart:convert';

import 'package:ap_config/mainpage/login.dart';
import 'package:ap_config/mainpage/selectconfig.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const background = Color(0xFFC1DEAE);
const write = Color(0xFFFAFAFA);
const button = Color(0xFF536DFE);
const grey = Color(0xFF616161);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: background,
    textStyle: const TextStyle(
      fontSize: 20,
    ));

class ProfilesConfig extends StatefulWidget {
  const ProfilesConfig({Key key}) : super(key: key);

  @override
  _ProfilesConfigState createState() => _ProfilesConfigState();
}

class _ProfilesConfigState extends State<ProfilesConfig> {
  Localserver() async {
    // final ipv4 = await Wifi.ip;

    var senddata = {"local": "yes"};
    String json = jsonEncode(senddata);
    var url = "http://192.168.4.11/loadConfig?data=${json}";
    var response = await http.get(Uri.parse(url));
    String jsonResponse = response.body;
    if (response.statusCode == 200) {
      Navigator.pop(context);
    }
  }

  Future<void> dialogconfirm() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirm to Localserver'),
            content: SizedBox(
              height: 10,
              width: double.infinity,
              child: Column(),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFE64A19),
                    textStyle: const TextStyle(fontSize: 20, color: write)),
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF388E3C),
                    textStyle: const TextStyle(fontSize: 20, color: write)),
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    Localserver();
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Login()));
              },
              child: Icon(
                Icons.logout_outlined,
                color: write,
              ),
            ),
          ],
        ),
        backgroundColor: background,
        elevation: 0,
        iconTheme: IconThemeData(color: background),
      ),
      body: Container(
            color: background,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Container(
                    padding: EdgeInsets.only(top: 14, bottom: 30),
                    child: Text("Menu",
                        style: TextStyle(
                          color: grey,
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                        )),
                  ),
                ),
              ],
            ),
            Expanded(
              child:  Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: write,borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
                ),
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          dialogconfirm();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top:50),
                          width: 300,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(10),
                              color: write,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 0.5)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "LOCAL SERVER",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'RobotoMono',
                                      color: grey),
                                ),
                                Container(
                                  width: 50,
                                  child: Icon(Icons.language_outlined, color: grey),
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => ConfigAP()));
                        },
                        child: Container(
                          width: 300,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(10),
                              color: write,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 0.5)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "INTERNET SERVER",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'RobotoMono',
                                      color: grey),
                                ),
                                Container(
                                  width: 50,
                                  child: Icon(Icons.cloud_upload, color: grey),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        )),
    );
  }
}
