import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:ap_config/mainpage/profile.dart';

const background = Color(0xFFFEF5ED);
const font = Color(0xFF99A799);
const button = Color(0xFF99A799);
final ButtonStyle style =
ElevatedButton.styleFrom(primary: button,textStyle: const TextStyle(fontSize: 20,));
class APIOSconnect extends StatefulWidget {
  const APIOSconnect({Key key}) : super(key: key);

  @override
  _APIOSconnectState createState() => _APIOSconnectState();
}

class _APIOSconnectState extends State<APIOSconnect> {


  TextEditingController ssid;
  TextEditingController passwords;
  String result = "";
  bool done = false, success = false;
  bool _isObscure = true;
  var _isSucceed = false;

  @override
  void initState() {
    super.initState();
    ssid = new TextEditingController(text: 'OBT-Dept');
    passwords = new TextEditingController(text: 'Obt@2021');
  }

  connect() async {
    var isConnected = await WiFiForIoTPlugin.connect(ssid.text,
        security: NetworkSecurity.WPA, password: passwords.text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        iconTheme: IconThemeData(color: font),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: ssid,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ssid',
              ),
            ),
              TextField(
              obscureText: _isObscure,
              controller: passwords,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
            ),
            ElevatedButton(onPressed: connect, child: Text("Connect"))
          ],
        ),
      ),
    );
  }
}
