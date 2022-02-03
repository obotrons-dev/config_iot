import 'package:ap_config/mainpage/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'dart:io' show Platform;
import 'package:ap_config/page/connectAP.dart';

const background = Color(0xFFFEF5ED);
const font = Color(0xFF536DFE);
const button = Color(0xFF536DFE);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: button,
    textStyle: const TextStyle(
      fontSize: 20,
    ));

class WifiAp extends StatefulWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  _WifiApState createState() => _WifiApState();
}

class _WifiApState extends State<WifiAp> {
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
        ));
  }

  List<WifiNetwork> _htResultNetwork = [];
  List<WifiNetwork> index;

  bool _isEnabled = false;
  bool _isConnected = false;
  String ssid = "";
  bool _loading = true;
  TextEditingController controller = new TextEditingController();

  @override
  initState() {
    getWifis().then((value) {
      index.addAll(value);
      _htResultNetwork = index;
    });
    super.initState();
  }

  getWifis() async {
    _isEnabled = await WiFiForIoTPlugin.isEnabled();
    _isConnected = await WiFiForIoTPlugin.isConnected();
    _htResultNetwork = await loadWifiList();
    setState(() {
      if (_isConnected != null) {
        WiFiForIoTPlugin.getSSID().then((value) => setState(() {
              ssid = value;
              _loading = false;
            }));
      } else {
        _loading = true;
      }
    });
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
    WiFiForIoTPlugin.isConnected().then((val) => setState(() {
          _isConnected = val;
        }));

    return SingleChildScrollView(
      child: Column(
        children: getButtonWidgetsForAndroid(context),
      ),
    );
  }

  List<Widget> getButtonWidgetsForAndroid(context) {
    List<Widget> htPrimaryWidgets = List();
    WiFiForIoTPlugin.isEnabled().then((val) => setState(() {
          _isEnabled = val;
        }));
    htPrimaryWidgets.addAll({
      SafeArea(
        child: ListTile(
            leading: Text(
              'Wi-Fi',
              style: TextStyle(color: background),
            ),
            trailing: Switch(
                activeColor: background,
                value: _isEnabled,
                onChanged: (v) {
                  if (_isEnabled) {
                    WiFiForIoTPlugin.setEnabled(false);
                  } else {
                    WiFiForIoTPlugin.setEnabled(true);
                    getWifis();
                  }
                  setState(() {
                    _isEnabled = !_isEnabled;
                  });
                })),
        // color: _isEnabled ? Colors.green : Colors.red,
      ),
      SizedBox(height: 10),
      Text(
        'Wi-Fi Found',
        style: TextStyle(fontSize: 25, color: background),
        textAlign: TextAlign.center,
      ),
      IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            getWifis();
          }),
      getList(context),
    });
    if (_isEnabled) {
      WiFiForIoTPlugin.isConnected().then((val) {
        if (val != null) {
          setState(() {
            _isConnected = val;
          });
        }
      });
    }
    return htPrimaryWidgets;
  }

  Widget getList(BuildContext context) {
    Set<String> newstr = Set();
    for (var x = 0; x < _htResultNetwork.length; x++) {
      var network = _htResultNetwork[x];
      if (network.ssid.contains('iaq')) newstr.add(network.ssid);
    }
    List<String> newlist = newstr.toList();
    return ListView.builder(
        itemCount: newlist.length,
        // ignore: missing_return
        itemBuilder: (context, int i) {
          var network = newlist[i];
          var isConnctedWifi = false;
          if (_isConnected) isConnctedWifi = isRegisteredWifiNetwork(network);
          if (newstr != null) {
            return Card(
              color: font,
              child: ListTile(
                  leading: Icon(
                    Icons.wifi,
                    color: background,
                  ),
                  title: Text(
                    '${network}',
                    style: TextStyle(color: background),
                  ),
                  trailing: !isConnctedWifi
                      ? OutlineButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Attack(network)));
                          },
                          child: Text(
                            'connect',
                            style: TextStyle(color: background),
                          ),
                        )
                      : SizedBox()),
            );
          }
        },
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics());
  }
}

class PopupCommand {
  String command;
  String argument;

  PopupCommand(this.command, this.argument);
}
