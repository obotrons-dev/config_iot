import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ap_config/page/wifistation.dart';

const background = Color(0xFFC1DEAE);
const write = Color(0xFFFAFAFA);
const button = Color(0xFF536DFE);
const grey = Color(0xFF616161);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: background,
    textStyle: const TextStyle(
      fontSize: 20,
    ));

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
    _selectedValue = "5";
  }

  Future mqtt() async {
    if (host.text.length > 0 &&
        port.text.length > 0 &&
        sub.text.length > 0 &&
        user.text.length > 0 &&
        passwords.text.length > 0) {
      var data = {
        "type": "mqtt",
        "host": host.text,
        "port": port.text,
        "subscribe": sub.text,
        "username": user.text,
        "password": passwords.text,
        "otapath": otapath.text,
        "otacode": otacode.text,
        "millisecond": _selectedValue
      };
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WifiStation(data)));
    }
  }
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: new EdgeInsets.all(20.0),
                        child: Text(
                          "MQTT Server Setting",
                          style: TextStyle(fontSize: 20, color: grey),
                        ),
                      ),
                    ],
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
                              controller: host,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'Host',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300.0,
                          child: Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextField(
                              controller: port,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'Port',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300.0,
                          child: Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextField(
                              controller: sub,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'Subscribe',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300.0,
                          child: Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextField(
                              controller: user,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'Username',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300.0,
                          child: Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextField(
                              controller: passwords,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 300.0,
                          child: Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextField(
                              controller: otapath,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  labelText: 'OTA Path',
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
                                  labelText: 'OTA Code',
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
                            style: style, onPressed: mqtt, child: Text("Next")),
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
