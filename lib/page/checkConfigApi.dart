import 'package:flutter/material.dart';

const background = Color(0xFFFEF5ED);
const font = Color(0xFF536DFE);
const button = Color(0xFF536DFE);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: button,
    textStyle: const TextStyle(
      fontSize: 20,
    ));
const textstyle =
    TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'RobotoMono');

class CheckConfigAPI extends StatefulWidget {
  final dynamic str;

  CheckConfigAPI(this.str);

  @override
  _CheckConfigAPIState createState() => _CheckConfigAPIState();
}

class _CheckConfigAPIState extends State<CheckConfigAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: font,
        iconTheme: IconThemeData(color: background),
        elevation: 0,
        title: Text(
          "CheckConfig",
          style: TextStyle(color: background),
        ),
      ),
      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [font, background],
          )),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [font, background],
                                )),
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
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [font, background],
                                )),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text('Storage',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    '${widget.str.config.storage} ' ??
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
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [font, background],
                                )),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text('Path',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    '${widget.str.config.path} ' ??
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
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [font, background],
                                )),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text('HttpHeader',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    '${widget.str.config.httpheader} ' ??
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
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [font, background],
                                )),
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
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [font, background],
                                )),
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
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [font, background],
                                )),
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text('Time to send(miniute)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    '${widget.str.config.millisecond} minute' ??
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
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [font, background],
                                  )),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Text('WiFi-ssid',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  Text(
                                      '${widget.str.wifi.ssid} ' ??
                                          'ไม่พบข้อมูล',
                                      style: textstyle),
                                ],
                              ))),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
