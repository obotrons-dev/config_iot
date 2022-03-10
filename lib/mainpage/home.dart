import 'package:ap_config/mainpage/apIOS.dart';
import 'package:ap_config/mainpage/listwifi.dart';
import 'package:ap_config/mainpage/profile.dart';
import 'package:ap_config/mainpage/scanmac.dart';
import 'package:ap_config/mainpage/scanmacIOS.dart';
import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'dart:io' show Platform;

const background = Color(0xFFC1DEAE);
const font = Color(0xFF536DFE);
const write = Color(0xFFFAFAFA);
const button = Color(0xFF536DFE);
const grey = Color(0xFF616161);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: button,
    textStyle: const TextStyle(
      fontSize: 20,
    ));

class HomeApp extends StatelessWidget {
  const HomeApp({Key key}) : super(key: key);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Container(
                    padding: EdgeInsets.only(top: 14, bottom: 30),
                    child: Text("Menu",
                        style: TextStyle(
                          color: grey,
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                        )),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: write,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(75.0))),
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        if (Platform.isAndroid) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WifiAp()));
                        } else if (Platform.isIOS) {
                          AppSettings.openSoundSettings();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilesConfig()),
                            (Route<dynamic> route) => false,
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(10),
                            color: write,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 0.5)
                            ]),
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1.Config Device",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'RobotoMono',
                                    color: grey),
                              ),
                              Container(
                                width: 50,
                                child: Icon(Icons.build, color: grey),
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ScanMac()));
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
                    child: Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(10),
                          color: write,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 0.5)
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "2.Manage Device",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'RobotoMono',
                                  color: grey),
                            ),
                            Container(
                              width: 50,
                              child: Icon(Icons.qr_code_scanner_rounded,
                                  color: grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
