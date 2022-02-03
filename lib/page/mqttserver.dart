import 'package:ap_config/mainpage/selectconfig.dart';
import 'package:ap_config/json/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ap_config/page/wifistation.dart';

const background = Color(0xFFFEF5ED);
const font = Color(0xFF536DFE);
const button = Color(0xFF536DFE);
final ButtonStyle style =
ElevatedButton.styleFrom(
    primary: button, textStyle: const TextStyle(fontSize: 20,));

class MQTTServer extends StatefulWidget {

  const MQTTServer({Key key}) : super(key: key);

  @override
  _MQTTServerState createState() => _MQTTServerState();
}

class _MQTTServerState extends State<MQTTServer> {


  TextEditingController host;
  TextEditingController port;
  TextEditingController sub;
  TextEditingController user;
  TextEditingController passwords;
  TextEditingController clientID;
  TextEditingController otapath;
  TextEditingController otacode;
  TextEditingController millisec;

  bool processing = false;

  void initState() {
    super.initState();
    host = new TextEditingController();
    port = new TextEditingController();
    sub = new TextEditingController();
    user = new TextEditingController();
    passwords = new TextEditingController();
    clientID = new TextEditingController();
    otapath = new TextEditingController();
    otacode = new TextEditingController();
    millisec = new TextEditingController();
  }


  Future mqtt() async {
    if (host.text.length > 0 && port.text.length > 0 && sub.text.length > 0 &&
        user.text.length > 0 && passwords.text.length > 0) {
      setState(() {
        processing = true;
      });
      var data = {"type": "mqtt",
        "host": host.text,
        "port": port.text,
        "subscribe": sub.text,
        "username": user.text,
        "password": passwords.text,
        "otapath": otapath.text,
        "otacode": otacode.text,
        "millisecond": millisec.text
      };
      Navigator.
      push(
          context, MaterialPageRoute(builder: (context) => WifiStation(data)));

      print("success");
    }
    else {
      setState(() {
        processing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("MQTT Setting", style: TextStyle(color: background)),
          backgroundColor: font,
          iconTheme: IconThemeData(color: background),
        ),
        backgroundColor: background,
        body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [font, background],
                )),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: new EdgeInsets.all(20.0),
                          child: Text(
                            "MQTT Server Setting",
                            style: TextStyle(fontSize: 20, color: background),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 75)),
                            Container(
                              child: SizedBox(
                                width: 250.0,
                                child: Container(
                                  padding: EdgeInsets.only(top: 15),
                                  child: TextField(
                                    style: TextStyle(color: Colors.black),
                                    controller: host,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white),
                                      ),
                                      labelText: 'Host',
                                      labelStyle: TextStyle(fontSize: 20.0,
                                          color: Colors.black26),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 75)),
                            SizedBox(
                              width: 150.0,
                              child: Container(
                                padding: EdgeInsets.only(top: 15),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  controller: port,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white),
                                    ),
                                    labelText: 'Port',
                                    labelStyle: TextStyle(
                                        fontSize: 20.0, color: Colors.black26),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 75)),
                            SizedBox(
                              width: 250.0,
                              child: Container(
                                padding: EdgeInsets.only(top: 15),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  controller: sub,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white),
                                    ),
                                    labelText: 'Subscribe',
                                    labelStyle: TextStyle(
                                        fontSize: 20.0, color: Colors.black26),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 75)),
                            SizedBox(
                              width: 250.0,
                              child: Container(
                                padding: EdgeInsets.only(top: 15),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  controller: user,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white),
                                    ),
                                    labelText: 'username',
                                    labelStyle: TextStyle(
                                        fontSize: 20.0, color: Colors.black26),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 75)),
                            SizedBox(
                              width: 250.0,
                              child: Container(
                                padding: EdgeInsets.only(top: 15),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  controller: passwords,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white),
                                    ),
                                    labelText: 'password',
                                    labelStyle: TextStyle(
                                        fontSize: 20.0, color: Colors.black26),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 75)),
                            SizedBox(
                              width: 250.0,
                              child: Container(
                                padding: EdgeInsets.only(top: 15),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  controller: otapath,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white),
                                    ),
                                    labelText: 'otapath',
                                    labelStyle: TextStyle(
                                        fontSize: 20.0, color: Colors.black26),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 75)),
                            SizedBox(
                              width: 250.0,
                              child: Container(
                                padding: EdgeInsets.only(top: 15),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  controller: otacode,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white),
                                    ),
                                    labelText: 'otacode',
                                    labelStyle: TextStyle(
                                        fontSize: 20.0, color: Colors.black26),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 75)),
                            SizedBox(
                              width: 250.0,
                              child: Container(
                                padding: EdgeInsets.only(top: 15),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  controller: millisec,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white),
                                    ),
                                    labelText: 'Time to send data(ms)',
                                    labelStyle: TextStyle(
                                        fontSize: 20.0, color: Colors.black26),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                        style: style,
                        onPressed: mqtt,
                        child: Text(
                            "Next"
                        )),
                  ],
                ),
              ),
            ),
        )
    );
  }
}
