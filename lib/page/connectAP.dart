import 'package:ap_config/mainpage/profile.dart';
import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';


const background = Color(0xFFFEF5ED);
const font = Color(0xFF99A799);
const button = Color(0xFF99A799);
final ButtonStyle style =
ElevatedButton.styleFrom(primary: button,textStyle: const TextStyle(fontSize: 20,));
final snackBar = SnackBar(content: Container(height: 30,
  padding: EdgeInsets.only(top:5),
  child: Text('Password wrong',style: TextStyle(color:Colors.black,fontSize: 14),textAlign: TextAlign.center,),
),
  duration: const Duration(milliseconds: 1500),
  padding: const EdgeInsets.symmetric(
    horizontal: 8.0, // Inner padding for SnackBar content.
  ),
  width: 200,
  backgroundColor: Colors.redAccent,
  behavior: SnackBarBehavior.floating,);


class Attack extends StatefulWidget {
  final dynamic wifiNetwork;
  Attack(this.wifiNetwork);
  @override
  _AttackState createState() => _AttackState();
}

class _AttackState extends State<Attack> {
  String result = "", currentPass = '' , ssid = '' ,pwd = '';
  bool done = false, success = false;
  TextEditingController passwords;


  @override
  void initState() {
    super.initState();
    passwords = new TextEditingController(text:'pwdIAQ@iot');

  }

  startAttack() async {

    currentPass = passwords.text;

    var isConnected = await WiFiForIoTPlugin.connect(widget.wifiNetwork,
        security: NetworkSecurity.WPA, password: currentPass);

    if(isConnected) {
    setState(() {
    success = true;
    done = true;
    });
    Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => ProfilesConfig()),
          (Route<dynamic> route) => false,);
    }
    if (!isConnected) {
      setState(() {
      });
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Password for " + widget.wifiNetwork,style: TextStyle(color: font),),
        backgroundColor: background,
      ),
      body: Container(
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
