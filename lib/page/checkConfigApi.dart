import 'package:flutter/material.dart';


const background = Color(0xFFFEF5ED);
const font = Color(0xFF99A799);
const button = Color(0xFF99A799);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: button, textStyle: const TextStyle(fontSize: 20, color: font));

class CheckConfigAPI extends StatefulWidget {

  final dynamic str ;
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
        iconTheme: IconThemeData(color: font),
        elevation: 0,
        title: Text("CheckData",style: TextStyle(color: font),),
      ),
      backgroundColor: background,
      body: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Type : ${widget.str.config.type} ' ?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('Storage : ${widget.str.config.storage} '?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('Path : ${widget.str.config.path}'?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('HttpHeader : ${widget.str.config.httpheader}'?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('OTA : ${widget.str.config.ota}'?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('OTA-Code : ${widget.str.config.otacode}'?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize:15,fontFamily: 'RobotoMono'),),
                  Text('Time to send(minute) : ${widget.str.config.millisecond}'?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('Wifi_ssid : ${widget.str.wifi.ssid}'?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                ],
              ),
            )
          )
      ),
    );
  }
}
