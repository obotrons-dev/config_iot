import 'package:flutter/material.dart';

const background = Color(0xFFC1DEAE);
const write = Color(0xFFFAFAFA);
const button = Color(0xFF536DFE);
const grey = Color(0xFF616161);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: background,
    textStyle: const TextStyle(
      fontSize: 20,
    ));
const textstyle =
TextStyle(color: grey, fontSize: 15, fontFamily: 'RobotoMono');

class CheckConfigMQTT extends StatefulWidget {
  final dynamic str;

  CheckConfigMQTT(this.str);

  @override
  _CheckConfigMQTTState createState() => _CheckConfigMQTTState();
}

class _CheckConfigMQTTState extends State<CheckConfigMQTT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        iconTheme: IconThemeData(color: write),
        elevation: 0,
      ),
      body: Container(
          height: double.infinity,
    color: background,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "CheckConfig",
                  style: TextStyle(color: grey,fontSize: 25,fontFamily: 'RobotoMono'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 350.0,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: write,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 0.5)
                                ]),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text('Type',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    '${widget.str.config.type} ' ??
                                        'ไม่พบข้อมูล',
                                    style: textstyle),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 350.0,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: write,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 0.5)
                                ]),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text('Host',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    '${widget.str.config.host} ' ??
                                        'ไม่พบข้อมูล',
                                    style: textstyle),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 350.0,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: write,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 0.5)
                                ]),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text('Host',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    '${widget.str.config.port} ' ??
                                        'ไม่พบข้อมูล',
                                    style: textstyle),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 350.0,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: write,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 0.5)
                                ]),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text('Subscribe',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    '${widget.str.config.subscribe} ' ??
                                        'ไม่พบข้อมูล',
                                    style: textstyle),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 350.0,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: write,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 0.5)
                                ]),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text('username',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    '${widget.str.config.username} ' ??
                                        'ไม่พบข้อมูล',
                                    style: textstyle),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 350.0,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: write,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 0.5)
                                ]),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text('OTA',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    '${widget.str.config.ota} ' ??
                                        'ไม่พบข้อมูล',
                                    style: textstyle),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 350.0,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: write,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 0.5)
                                ]),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text('OTA-Code',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    '${widget.str.config.otacode} ' ??
                                        'ไม่พบข้อมูล',
                                    style: textstyle),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 350.0,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: write,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 0.5)
                                ]),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text('MilliSecond',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    '${widget.str.config.millisecond} ' ??
                                        'ไม่พบข้อมูล',
                                    style: textstyle),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 350.0,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: write,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 0.5)
                                ]),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text('Wifi-ssid',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    '${widget.str.config.wifi.ssid} ' ??
                                        'ไม่พบข้อมูล',
                                    style: textstyle),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
