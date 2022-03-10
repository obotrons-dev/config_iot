import 'package:ap_config/mainpage/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'dart:io' show Platform;
import 'package:ap_config/page/connectAP.dart';

const background = Color(0xFFC1DEAE);
const font = Color(0xFF536DFE);
const write = Color(0xFFFAFAFA);
const button = Color(0xFF536DFE);
const grey = Color(0xFF616161);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: background,
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
          backgroundColor: background,
          iconTheme: IconThemeData(color: write),
          elevation: 0,
        ),
        body: Container(
          height: double.infinity,
          color: background,
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
              style: TextStyle(color: grey),
            ),
            trailing: Switch(
                activeColor: write,
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
                })
        ),
      ),
      SizedBox(height: 10),
      Text(
        'Wi-Fi Found',
        style: TextStyle(fontSize: 25, color: grey),
        textAlign: TextAlign.center,
      ),
      IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            getWifis();
          }),
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: write,borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
        ),
        padding: EdgeInsets.all(20),
        child:getList(context),
      ),

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
      if (network.ssid.contains('IAQ')) newstr.add(network.ssid);
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
              color: write,
              child: ListTile(
                  leading: Icon(
                    Icons.wifi,
                    color: grey,
                  ),
                  title: Text(
                    '${network}',
                    style: TextStyle(color: grey),
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
                            style: TextStyle(color: grey),
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
