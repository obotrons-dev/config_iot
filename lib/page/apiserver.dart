import 'package:ap_config/page/scroll.dart';
import 'package:ap_config/page/wifistationios.dart';
import 'package:flutter/material.dart';
import 'package:ap_config/page/wifistation.dart';
import 'dart:io' show Platform;

const background = Color(0xFFC1DEAE);
const write = Color(0xFFFAFAFA);
const button = Color(0xFF536DFE);
const grey = Color(0xFF616161);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: background,
    textStyle: const TextStyle(
      fontSize: 20,
    ));

class ApiServer extends StatefulWidget {
  const ApiServer({Key key}) : super(key: key);

  @override
  _ApiServerState createState() => _ApiServerState();
}

class _ApiServerState extends State<ApiServer> {
  TextEditingController storage;
  TextEditingController path;
  TextEditingController http;
  TextEditingController ota;
  TextEditingController otacode;
  TextEditingController millisec;

  bool processing = false;

  String _selectedValue;
  List<DropdownMenuItem<String>> items = [
    '1',
    '3',
    '5',
    '7',
    '10',
    '15',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        value,
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
    );
  }).toList();
  String positions;

  void initState() {
    super.initState();
    storage =
        new TextEditingController(text: 'http://cloud.risc.dtgsiam.com:8080');
    path = new TextEditingController(
        text: '/CloudDataStorage/RiscServiceIAQ/receiveIAQdataIOT.html');
    http = new TextEditingController();
    ota = new TextEditingController(
        text: 'http://api.arduino.obotrons.net/api/ota.php');
    otacode = new TextEditingController();
    millisec = new TextEditingController();
    _selectedValue = "5";
  }

  Future api() async {
    if (storage.text.length > 0 &&
        path.text.length > 0 &&
        http.text.length > 0 &&
        ota.text.length > 0) {
      setState(() {
        processing = true;
      });
      var apidata = {
        "type": "api",
        "storage": storage.text,
        "path": path.text,
        "httpheader": http.text,
        "ota": ota.text,
        "otacode": otacode.text,
        "millisecond": _selectedValue
      };
      if (Platform.isAndroid) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WifiStation(apidata)));
      }
      if (Platform.isIOS) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WifiStationIOS(apidata)));
      }
    } else {
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
          backgroundColor: background,
          iconTheme: IconThemeData(color: write),
        ),
        body: Container(
          height: double.infinity,
          color: background,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: new EdgeInsets.all(20.0),
                    child: Text(
                      "Api Server Setting",
                      style: TextStyle(fontSize: 20, color: grey),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: write,borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300.0,
                          child: Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextField(
                              controller: storage,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'Storage',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300.0,
                          child: Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextField(
                              controller: path,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'Storage path',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300.0,
                          child: Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextField(
                              controller: http,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'HTTP header',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300.0,
                          child: Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextField(
                              controller: ota,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'OTA Storage',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300.0,
                          child: Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextField(
                              controller: otacode,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'OTA code',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300.0,
                          child: Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text("Time to SendData(minute)"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300.0,
                          child: Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(),
                                  color: write),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  style: TextStyle(color: grey),
                                  icon: Icon(Icons.arrow_drop_down_circle,
                                      color: Colors.grey.withOpacity(0.7)),
                                  items: items,
                                  onChanged: (String value) {
                                    setState(() {
                                      _selectedValue = value;
                                    });
                                  },
                                  hint: Text(
                                    "Time to send Data(minute)",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  value: _selectedValue,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            style: style, onPressed: api, child: Text("Next")),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
