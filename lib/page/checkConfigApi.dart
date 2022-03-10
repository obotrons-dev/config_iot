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
          backgroundColor: background,
          iconTheme: IconThemeData(color: write),
          elevation: 0,
        ),
        body: Container(
            color: background,
            height: double.infinity,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                    color: background,
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(children: [
                          Text(
                            "CheckConfig",
                            style: TextStyle(
                                color: grey,
                                fontSize: 25,
                                fontFamily: 'RobotoMono'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  width: 300.0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: write,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 0.5)
                                          ]),
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Text('Type',
                                              style: TextStyle(
                                                  color: grey,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  width: 300.0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: write,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 0.5)
                                          ]),
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Text('Storage',
                                              style: TextStyle(
                                                  color: grey,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  width: 300.0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: write,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 0.5)
                                          ]),
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Text('Path',
                                              style: TextStyle(
                                                  color: grey,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  width: 300.0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: write,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 0.5)
                                          ]),
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Text('HttpHeader',
                                              style: TextStyle(
                                                  color: grey,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  width: 300.0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: write,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 0.5)
                                          ]),
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Text('OTA',
                                              style: TextStyle(
                                                  color: grey,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  width: 300.0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: write,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 0.5)
                                          ]),
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Text('OTA-Code',
                                              style: TextStyle(
                                                  color: grey,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  width: 300.0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: write,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 0.5)
                                          ]),
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Text('Time to send(miniute)',
                                              style: TextStyle(
                                                  color: grey,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 10)),
                              ])
                        ])))
              ],
            ))));
  }
}
