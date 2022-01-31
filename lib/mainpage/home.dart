import 'package:ap_config/mainpage/apIOS.dart';
import 'package:ap_config/mainpage/listwifi.dart';
import 'package:ap_config/mainpage/profile.dart';
import 'package:ap_config/mainpage/scanmac.dart';
import 'package:ap_config/mainpage/scanmacIOS.dart';
import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'dart:io' show Platform;


class HomeApp extends StatelessWidget {
  const HomeApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFFFEF5ED);
    const font = Color(0xFF99A799);
    const button = Color(0xFF99A799);
    final ButtonStyle style =
    ElevatedButton.styleFrom(primary: button,textStyle: const TextStyle(fontSize: 20,));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        iconTheme: IconThemeData(color: font),
        elevation: 0,
      ),
        backgroundColor: background,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child:  Container(
                      padding: EdgeInsets.only(top:14,left: 30,bottom: 30),
                      child: Text("Menu",style: TextStyle(color:font,fontSize: 35,fontWeight:FontWeight.w900,)),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                  onTap:() {
                    if(Platform.isAndroid){
                      Navigator.
                      push(
                          context, MaterialPageRoute(builder: (context) => WifiAp()));
                    }else if (Platform.isIOS){
                      AppSettings.openSoundSettings();
                      Navigator.pushAndRemoveUntil(
                        context, MaterialPageRoute(builder: (context) => ProfilesConfig()),
                            (Route<dynamic> route) => false,);
                    }
                  },
                  child:Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        bottomRight: const Radius.circular(100.0),
                        topRight: const Radius.circular(100.0),
                      ),
                      color: font,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("1.Config Device",style: TextStyle(fontSize:20,fontFamily: 'RobotoMono',color: background),),
                          Container(
                            width: 50,
                            color: font,
                            child: Icon(Icons.wifi_tethering,color: background),
                          ),
                        ],),
                    )
                    ,)
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap:() {
                  Navigator.
                  push(
                      context, MaterialPageRoute(builder: (context) => ScanMac()));
                  // if(Platform.isAndroid){
                  //   Navigator.
                  //   push(
                  //       context, MaterialPageRoute(builder: (context) => ScanMac()));
                  // }else if (Platform.isIOS){
                  //   // Navigator.
                  //   // push(
                  //   //     context, MaterialPageRoute(builder: (context) => ScanMacIOS()));
                  // }

                },
                child:Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    bottomRight: const Radius.circular(100.0),
                    topRight: const Radius.circular(100.0),
                  ),
                  color: font,
                ),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("2.Manage Device",style: TextStyle(fontSize: 20,fontFamily: 'RobotoMono', color: background),),
                          Container(
                            width: 50,
                            color: font,
                            child: Icon(Icons.qr_code_scanner_rounded,color: background),
                          ),
                        ],),
                    ),
              ),),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )
    );
  }
}
