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
      appBar: AppBar(
        backgroundColor: font,
        iconTheme: IconThemeData(color: background),
        elevation: 0,
        title: Text("CheckData",style: TextStyle(color: background),),
      ),
      body:Container(
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [font, background],
                )),
            child:Padding(
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
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Text('iaq_Co2',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                  Text(
                                      '${widget.str.iaqCO2}' ??
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
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Text('iaq_TVOC',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                  Text(
                                      '${widget.str.iaqTVOC}' ??
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
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Text('iaq_PM1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                  Text(
                                      '${widget.str.iaqPM1}' ??
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
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Text('iaq_PM2.5',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                  Text(
                                      '${widget.str.iaqPM25}' ??
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
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Text('iaq_PM10',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                  Text(
                                      '${widget.str.iaqPM10}' ??
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
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Text('iaq_TEMP',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                  Text(
                                      '${widget.str.iaqTEMP}' ??
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
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Text('iaq_RH',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                  Text(
                                      '${widget.str.iaqRH}' ??
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
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Text('iaq_Mac',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
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
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Text('iaq_Local_IP',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
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
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Text('iaq_SSID',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
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
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Text('iaq_Date',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
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
              ),
            )
      ),
    );
  }
}
