import 'package:ap_config/mainpage/profile.dart';
import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


const background = Color(0xFFFEF5ED);
const font = Color(0xFF536DFE);
const button = Color(0xFF536DFE);
final ButtonStyle style =
ElevatedButton.styleFrom(primary: button,textStyle: const TextStyle(fontSize: 20,));


class Attack extends StatefulWidget {
  final dynamic wifiNetwork;
  Attack(this.wifiNetwork);
  @override
  _AttackState createState() => _AttackState();
}

class _AttackState extends State<Attack> {
  String currentPass = '' , ssid = '' ,pwd = '';
  TextEditingController passwords;


  @override
  void initState() {
    super.initState();
    passwords = new TextEditingController(text:'pwdIAQ@iot');

  }

  startAttack() async {
    await EasyLoading.show(status: 'loading...');
    currentPass = passwords.text;
    var isConnected = await WiFiForIoTPlugin.connect(widget.wifiNetwork,
        security: NetworkSecurity.WPA, password: currentPass);

    if(isConnected) {
      EasyLoading.showSuccess('success');
    Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => ProfilesConfig()),
          (Route<dynamic> route) => false,);
    EasyLoading.dismiss();
    }
    else {
    }
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("Password for " + widget.wifiNetwork,style: TextStyle(color: background),),
        backgroundColor: font,
      ),
      backgroundColor: background,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [font, background],
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 50),
              child:SizedBox(width:300 ,
                child: TextField(
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
              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        "back",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),),
                ElevatedButton(
                  style:style,
                  onPressed: () {
                    startAttack();
                  },
                  child: SizedBox(
                    width: 100,
                    child: Text(
                      "Connect",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
