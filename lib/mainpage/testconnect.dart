
import 'dart:async';

import 'package:ap_config/json/qrcodeApi.dart';
import 'package:flutter/material.dart';
import 'package:wifi/wifi.dart';

class Testconnect extends StatefulWidget {
  final dynamic data;
  Testconnect(IAQ this.data);

  @override
  _TestconnectState createState() => new _TestconnectState();
}

class _TestconnectState extends State<Testconnect> {
  List<WifiResult> ssidList = [];
  String ssid = '', password = '';
  TextEditingController wifi_ssid;
  TextEditingController wifi_pwd;

  @override
  void initState() {
    super.initState();
    loadData();
    wifi_ssid = new TextEditingController(text: 'JOE50');
    wifi_pwd = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wifi'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: ssidList.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return itemSSID(index);
          },
        ),
      ),
    );
  }

  Widget itemSSID(index) {
    if (index == 0) {
      return Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.wifi),
              labelText: 'ssid',
            ),
            controller: wifi_ssid,
          ),
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.lock_outline),
              labelText: 'password',
            ),
            controller:wifi_pwd,
          ),
          RaisedButton(
            child: Text('connection'),
            onPressed: connection,
          ),
        ],
      );
    }
  }

  void loadData() async {
    Wifi.list('').then((list) {
      setState(() {
        ssidList = list;
      });
    });
  }
  
  Future<Null> connection() async {

    ssid = wifi_ssid.text;
    password = wifi_pwd.text;
    var connect = Wifi.connection(ssid, password).then((v) {
      print(v);
    });
  }
}