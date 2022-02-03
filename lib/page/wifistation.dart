import 'dart:convert';
import 'package:ap_config/mainpage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

const background = Color(0xFFFEF5ED);
const font = Color(0xFF536DFE);
const button = Color(0xFF536DFE);
final ButtonStyle style =
ElevatedButton.styleFrom(
    primary: button, textStyle: const TextStyle(fontSize: 20,));

final snackBar = SnackBar(
  content: Container(
    height: 30,
    padding: EdgeInsets.only(top: 5),
    child: Text(
      'copy to clipboard ',
      style: TextStyle(color: font, fontSize: 14),
      textAlign: TextAlign.center,
    ),
  ),
  duration: const Duration(milliseconds: 1500),
  padding: const EdgeInsets.symmetric(
    horizontal: 8.0, // Inner padding for SnackBar content.
  ),
  width: 200,
  backgroundColor: background,
  behavior: SnackBarBehavior.floating,
);

class WifiStation extends StatefulWidget {
  final dynamic data;

  WifiStation(this.data);

  @override
  _WifiStationState createState() => _WifiStationState();
}

class _WifiStationState extends State<WifiStation> {
  TextEditingController wifi_ssid;
  TextEditingController passwords;
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext poContext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: font,
        iconTheme: IconThemeData(color: background),
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [font, background],
            )),
        child: getWidgets(poContext),
      )
    );
  }

  List<WifiNetwork> _htResultNetwork = [];
  String ssid = "";

  @override
  initState() {
    getWifis();
    wifi_ssid = new TextEditingController();
    passwords = new TextEditingController();
    super.initState();
  }

  Future sendData() async {
    await EasyLoading.show(status: 'loading...');
    if (wifi_ssid.text.length > 0 && passwords.text.length > 0) {
      var senddata = {
        "local":"no",
        "config": this.widget.data,
        "wifi": {"ssid": wifi_ssid.text, "wifi_password": passwords.text}
      };
      String json = jsonEncode(senddata);
      var url = "http://192.168.4.11/loadConfig?data=${json}";
      var response = await http.get(Uri.parse(url));
      String jsonResponse = response.body;
      print(jsonResponse);

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeApp()));
        EasyLoading.dismiss();
      } else {
        EasyLoading.showError('fail');
        Navigator.pop(context);
      }
    }
  }
  getWifis() async {
    _htResultNetwork = await loadWifiList();
    setState(() {});
  }

  Future<List<APClient>> getClientList(
      bool onlyReachables, int reachableTimeout) async {
    List<APClient> htResultClient;
    try {
      htResultClient = await WiFiForIoTPlugin.getClientList(
          onlyReachables, reachableTimeout);
    } on PlatformException {
      htResultClient = List<APClient>();
    }

    return htResultClient;
  }

  Future<List<WifiNetwork>> loadWifiList() async {
    List<WifiNetwork> htResultNetwork;
    try {
      htResultNetwork = await WiFiForIoTPlugin.loadWifiList();
    } on PlatformException {
      htResultNetwork = List<WifiNetwork>();
    }

    return htResultNetwork;
  }

  isRegisteredWifiNetwork(String ssid) {
    return ssid == this.ssid;
  }

  Widget getWidgets(context) {
    WiFiForIoTPlugin.isConnected().then((val) => setState(() {}));

    return SingleChildScrollView(
      child: Column(
        children: getButtonWidgetsForAndroid(context),
      ),
    );
  }

  List<Widget> getButtonWidgetsForAndroid(context) {
    List<Widget> htPrimaryWidgets = List();
    WiFiForIoTPlugin.isEnabled().then((val) => setState(() {}));
    htPrimaryWidgets.addAll({
      SizedBox(height: 10),
      Text(
        "Config Wifi",
        style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono', color: background),
      ),
      IconButton(
          icon: Icon(
            Icons.refresh,
            color: background,
          ),
          onPressed: () {
            getWifis();
          }),
      getList(context),
      SizedBox(
        height: 20,
      ),
      // Container(
      //   height: 20,
      //   child:  InkWell(
      //     onTap: showToast,
      //     child: Text("Other network",style: TextStyle(color: Colors.blue),),
      //   ),
      // ),
      Visibility(
        visible: _isVisible,
        child: SizedBox(
          width: 300,
          child: TextField(
            controller: wifi_ssid,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'ssid',
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(5),
      ),
      Visibility(
        visible: _isVisible,
        child: SizedBox(
          width: 300,
          child: TextField(
            controller: passwords,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
      ),
      Visibility(
        visible: _isVisible,
        child: ElevatedButton(
          style: style,
          onPressed: () {
            sendData();
          },
          child: Text("submit"),
        ),
      ),
    });

    return htPrimaryWidgets;
  }

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Future<void> dialogsenddata(String network) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Connect Wifi ${network}'),
            content: SizedBox(
              height: 150,
              width: double.infinity,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: 'ssid'),
                    controller: wifi_ssid =
                        new TextEditingController(text: '${network}'),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'password'),
                    controller: passwords,
                  )
                ],
              ),
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
                    sendData();
                  });
                },
              ),
            ],
          );
        });
  }

  Widget getList(BuildContext context) {
    Set<String> newstr = Set();
    for (var x = 0; x < _htResultNetwork.length; x++) {
      var network = _htResultNetwork[x];
      newstr.add(network.ssid);
    }
    List<String> newlist = newstr.toList();

    return ListView.builder(
        controller: _scrollController,
        itemCount: newlist.length,
        itemBuilder: (context, int i) {
          var network = newlist[i];
          var isConnctedWifi = false;
          if (network.isNotEmpty) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(50)),
                    ),
                    color: font,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            dialogsenddata(network);
                          },
                          child: ListTile(
                            title: Text(
                              '${network}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'RobotoMono',
                                  color: background),
                            ),
                            leading: Icon(Icons.wifi,color: background,),
                            trailing: Icon(
                              Icons.copy,
                              color: background,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]);
          } else
            return Center(
              child: Text('No wifi found'),
            );
        },
        shrinkWrap: true,
        reverse: true,
        physics: NeverScrollableScrollPhysics());
  }
}

class PopupCommand {
  String command;
  String argument;

  PopupCommand(this.command, this.argument);
}
