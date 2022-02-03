import 'dart:convert';

import 'package:ap_config/mainpage/login.dart';
import 'package:ap_config/mainpage/selectconfig.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


const background = Color(0xFFFEF5ED);
const font = Color(0xFF536DFE);
const button = Color(0xFF536DFE);
final ButtonStyle style =
ElevatedButton.styleFrom(primary: button,textStyle: const TextStyle(fontSize: 20,));


class ProfilesConfig extends StatefulWidget {
  const ProfilesConfig({Key key}) : super(key: key);

  @override
  _ProfilesConfigState createState() => _ProfilesConfigState();
}

class _ProfilesConfigState extends State<ProfilesConfig> {


  Localserver() async {

    // final ipv4 = await Wifi.ip;

    var senddata = {
      "local":"yes"
    };
    String json = jsonEncode(senddata);
    var url = "http://192.168.4.11/loadConfig?data=${json}";
    var response = await http.get(Uri.parse(url));
    String jsonResponse = response.body;
    if(response.statusCode == 200){
      Navigator.pop(context);
    }

  }


  Future<void> dialogconfirm() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirm to Localserver'),
            content: SizedBox(
              height: 10,
              width: double.infinity,
              child: Column(),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFE64A19),
                    textStyle: const TextStyle(fontSize: 20, color: font)),
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF388E3C),
                    textStyle: const TextStyle(fontSize: 20, color: font)),
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    Localserver();
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: style,
              onPressed: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (_) => Login()));
              },
              child: Icon(Icons.logout_outlined,color: background,),
            ),
          ],
        ),
        backgroundColor: font,
        elevation: 0,
        iconTheme: IconThemeData(color: font),
      ),
      body:Container(
        height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  font,
                  background,
                ],
              )
          ),
          child:SingleChildScrollView(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child:  Container(
                          padding: EdgeInsets.only(top:14,left: 30,bottom: 30),
                          child: Text("Menu",style: TextStyle(color:background,fontSize: 35,fontWeight:FontWeight.w900,)),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap:() {
                        dialogconfirm();
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
                              Text("LOCAL SERVER",style: TextStyle(fontSize:20,fontFamily: 'RobotoMono',color: background),),
                              Container(
                                width: 50,
                                color: font,
                                child: Icon(Icons.language_outlined,color: background),
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
                        Navigator.push(context,MaterialPageRoute(builder: (_) => ConfigAP()));
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
                              Text("INTERNET SERVER",style: TextStyle(fontSize:20,fontFamily: 'RobotoMono',color: background),),
                              Container(
                                width: 50,
                                color: font,
                                child: Icon(Icons.cloud_upload,color: background),
                              ),
                            ],),
                        )
                        ,)
                  ),
                ],)
          ) ,
      ),
    );
  }
}
