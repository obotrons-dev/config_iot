import 'package:flutter/material.dart';


const background = Color(0xFFFEF5ED);
const font = Color(0xFF99A799);
const button = Color(0xFF99A799);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: button, textStyle: const TextStyle(fontSize: 20, color: font));

class CheckConfigMQTT extends StatefulWidget {

  final dynamic str ;
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
                  Text('Namedevice : ${widget.str.nameDevice}',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('Type : ${widget.str.config.type} ' ?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('Host : ${widget.str.config.host} '?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('Port : ${widget.str.config.port}'?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('Subscribe : ${widget.str.config.subscribe}'?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('username : ${widget.str.config.username}'?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('OTA : ${widget.str.config.ota}'?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('OTA-Code : ${widget.str.config.otacode}'?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize:15,fontFamily: 'RobotoMono'),),
                  Text('MilliSecond : ${widget.str.config.millisecond}'?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                  Text('Wifi_ssid : ${widget.str.wifi.ssid}'?? 'ไม่พบข้อมูล',style: TextStyle(color: font,fontSize: 15,fontFamily: 'RobotoMono'),),
                ],
              ),
            )
          )
      ),
    );
  }
}
