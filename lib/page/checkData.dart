import 'package:flutter/material.dart';

const background = Color(0xFFFEF5ED);
const font = Color(0xFF99A799);
const button = Color(0xFF99A799);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: button, textStyle: const TextStyle(fontSize: 20, color: font));

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
        backgroundColor: background,
        iconTheme: IconThemeData(color: font),
        elevation: 0,
        title: Text("CheckData",style: TextStyle(color: font),),
      ),
      backgroundColor: background,
      body: Center(
        child: SizedBox(
          height: 400,
          child:Card(
            color: background ,
              shadowColor: Colors.green,
              elevation: 4,
            child:Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('iaq_Co2 : ${widget.str.iaqCO2}',style: TextStyle(color: font,fontSize: 17,fontFamily: 'RobotoMono'),),
                  Text('iaq_TVOC : ${widget.str.iaqTVOC}',style: TextStyle(color: font,fontSize: 17,fontFamily: 'RobotoMono'),),
                  Text('iaq_PM1 : ${widget.str.iaqPM1}',style: TextStyle(color: font,fontSize: 17,fontFamily: 'RobotoMono'),),
                  Text('iaq_PM2.5 : ${widget.str.iaqPM25}',style: TextStyle(color: font,fontSize: 17,fontFamily: 'RobotoMono'),),
                  Text('iaq_PM10 : ${widget.str.iaqPM10}',style: TextStyle(color: font,fontSize: 17,fontFamily: 'RobotoMono'),),
                  Text('iaq_TEMP : ${widget.str.iaqTEMP}',style: TextStyle(color: font,fontSize: 17,fontFamily: 'RobotoMono'),),
                  Text('iaq_RH : ${widget.str.iaqRH}',style: TextStyle(color: font,fontSize:17,fontFamily: 'RobotoMono'),),
                  Text('iaq_Mac : ${widget.str.iaqMAC}',style: TextStyle(color: font,fontSize: 17,fontFamily: 'RobotoMono'),),
                  Text('iaq_Local_IP : ${widget.str.iaqLocalIP}',style: TextStyle(color: font,fontSize: 17,fontFamily: 'RobotoMono'),),
                  Text('iaq_SSID : ${widget.str.iaqSSID}',style: TextStyle(color: font,fontSize: 17,fontFamily: 'RobotoMono'),),
                  Text('iaq_Date : ${widget.str.iaqDatetime}',style: TextStyle(color: font,fontSize: 17,fontFamily: 'RobotoMono'),),
                ],
              ),
            )
          )
        )
      ),
    );
  }
}
