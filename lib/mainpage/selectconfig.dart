import 'package:ap_config/page/apiserver.dart';
import 'package:ap_config/page/mqttserver.dart';
import 'package:flutter/material.dart';

class ConfigAP extends StatefulWidget {
  const ConfigAP({Key key}) : super(key: key);

  @override
  _ConfigAPState createState() => _ConfigAPState();
}

class _ConfigAPState extends State<ConfigAP>  with SingleTickerProviderStateMixin {
  @override
  void initState() {

      setState(() {
      });

    super.initState();
  }

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
                    child: Text("Configuration",style: TextStyle(color:font,fontSize: 35,fontWeight:FontWeight.w900,)),
                  ),
                ),
              ],
            ),
            Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(100.0),
                      topRight: const Radius.circular(100.0),
                    ),
                    color: font,
                  ),
                  child:GestureDetector(
                      onTap:() {
                        Navigator.
                        push(
                            context, MaterialPageRoute(builder: (context) => MQTTServer()));
                      },
                    child:Container(
                      child: Padding(
                          padding: EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("MQTT",style: TextStyle(fontSize: 30,fontFamily: 'RobotoMono', color: background),),
                           Container(
                             width: 100,
                             color: font,
                           ),
                            Icon(Icons.arrow_forward,color: background)
                        ],),
                      ))),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                  bottomRight: const Radius.circular(100.0),
                  topRight: const Radius.circular(100.0),
                ),
                color: font,
              ),
              child:Container(
                  child:GestureDetector(
                      onTap:() {
                        Navigator.
                        push(
                            context, MaterialPageRoute(builder: (context) => ApiServer()));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("API",style: TextStyle(fontSize: 30,fontFamily: 'RobotoMono',color: background),),
                            Container(
                              width: 100,
                              color: font,
                            ),
                            Icon(Icons.arrow_forward,color: background,)
                          ],),
                      ))),
            ),
          ],
        ),
      )
    );
  }
}

