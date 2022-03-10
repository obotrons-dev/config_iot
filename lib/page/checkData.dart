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

class CheckData extends StatefulWidget {
  final dynamic str;

  CheckData(this.str);

  @override
  _CheckDataState createState() => _CheckDataState();
}

class _CheckDataState extends State<CheckData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: background,
          iconTheme: IconThemeData(color: write),
          elevation: 0,
        ),
        body: Container(
          height: double.infinity,
          color: background,
          child: SingleChildScrollView(
          child:
              Column(
                children: [
                  Container(
                    child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text(
                              "CheckData",
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
                                            borderRadius: BorderRadius.circular(10),
                                            color: write,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 0.5)
                                            ]),
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text('iaq_Co2',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text(
                                                '${widget.str.iaqCO2} ppm' ??
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
                                            borderRadius: BorderRadius.circular(10),
                                            color: write,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 0.5)
                                            ]),
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text('iaq_TVOC',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text(
                                                '${widget.str.iaqTVOC} ppb' ??
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
                                            borderRadius: BorderRadius.circular(10),
                                            color: write,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 0.5)
                                            ]),
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text('iaq_PM1',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text(
                                                '${widget.str.iaqPM1} ug/m3' ??
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
                                            borderRadius: BorderRadius.circular(10),
                                            color: write,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 0.5)
                                            ]),
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text('iaq_PM2.5',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text(
                                                '${widget.str.iaqPM25} ug/m3' ??
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
                                            borderRadius: BorderRadius.circular(10),
                                            color: write,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 0.5)
                                            ]),
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text('iaq_PM10',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text(
                                                '${widget.str.iaqPM10} ug/m3' ??
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
                                            borderRadius: BorderRadius.circular(10),
                                            color: write,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 0.5)
                                            ]),
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text('iaq_TEMP',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text(
                                                '${widget.str.iaqTEMP} ํC' ??
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
                                            borderRadius: BorderRadius.circular(10),
                                            color: write,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 0.5)
                                            ]),
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text('iaq_RH',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text(
                                                '${widget.str.iaqRH} %' ??
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
                                            borderRadius: BorderRadius.circular(10),
                                            color: write,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 0.5)
                                            ]),
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text('iaq_Mac',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text(
                                                '${widget.str.iaqMAC}' ??
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
                                            borderRadius: BorderRadius.circular(10),
                                            color: write,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 0.5)
                                            ]),
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text('iaq_Local_IP',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text(
                                                '${widget.str.iaqLocalIP}' ??
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
                                            borderRadius: BorderRadius.circular(10),
                                            color: write,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 0.5)
                                            ]),
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text('iaq_SSID',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text(
                                                '${widget.str.iaqSSID}' ??
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
                                            borderRadius: BorderRadius.circular(10),
                                            color: write,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 0.5)
                                            ]),
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Text('iaq_Date',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                            Text(
                                                '${widget.str.iaqDatetime}' ??
                                                    'ไม่พบข้อมูล',
                                                style: textstyle),
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  )
                ]
              )
          ),
        )
    );
  }
}
