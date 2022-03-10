import 'package:ap_config/page/apiserver.dart';
import 'package:ap_config/page/mqttserver.dart';
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

class ConfigAP extends StatefulWidget {
  const ConfigAP({Key key}) : super(key: key);

  @override
  _ConfigAPState createState() => _ConfigAPState();
}

class _ConfigAPState extends State<ConfigAP>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Container(
                      padding: EdgeInsets.only(top: 14, bottom: 30),
                      child: Text("Configuration",
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
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(75.0))),
                      child: Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MQTTServer()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 50),
                                width: 300,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: new BorderRadius.circular(10),
                                    color: write,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 0.5)
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "MQTT",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'RobotoMono',
                                            color: grey),
                                      ),
                                      Container(
                                        width: 50,
                                        child: Icon(Icons.arrow_forward_ios,
                                            color: grey),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ApiServer()));
                              },
                              child: Container(
                                width: 300,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: new BorderRadius.circular(10),
                                    color: write,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 0.5)
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "API",
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
                        ],
                      ))),
            ],
          ),
        ));
  }
}
