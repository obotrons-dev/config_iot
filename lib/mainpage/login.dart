import 'dart:convert';
import 'package:ap_config/mainpage//home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController username, password;
  bool processing = false;
  bool _isObscure = true;
  void initState() {
    super.initState();
    username =  new TextEditingController(text: 'admin@123');
    password = new TextEditingController(text: 'password');
  }

  Future login() async {
    setState(() {
      processing = true;
    });
    var url = "http://api.arduino.obotrons.net/api/login.php";
    var data = {"username": username.text, "password": password.text};
    String body = jsonEncode(data);
    var respones = await http.post(Uri.parse(url), body: body);
    var jsonbody = jsonDecode(respones.body);

    if(jsonbody['msg'] == 'password match'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(height: 30,
        padding: EdgeInsets.only(top:5),
        child: Text('Loading ...',style: TextStyle(color:Colors.black,fontSize: 14),textAlign: TextAlign.center,),
      ),
        duration: const Duration(milliseconds: 1500),
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0, // Inner padding for SnackBar content.
        ),
        width: 200,
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeApp()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(height: 30,
        padding: EdgeInsets.only(top:5),
        child: Text('Password wrong ..',style: TextStyle(color:Colors.black,fontSize: 14),textAlign: TextAlign.center,),
      ),
        duration: const Duration(milliseconds: 1500),
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0, // Inner padding for SnackBar content.
        ),
        width: 200,
        backgroundColor: Colors.red[400],
        behavior: SnackBarBehavior.floating,));
    }
  }

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFFFEF5ED);
    const font = Color(0xFF99A799);
    const button = Color(0xFF99A799);
    final ButtonStyle style =
    ElevatedButton.styleFrom(primary: button,textStyle: const TextStyle(fontSize: 20,));
    return Scaffold(
      backgroundColor:background,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('images/Obt.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                    labelText: 'username',
                   ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: password,
                obscureText: _isObscure,
                decoration: InputDecoration(
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
            ),
            SizedBox(height:30),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                style: style,
                onPressed: login,
                child: Text(
                  'Login',
                ),
              ),
            ),
            SizedBox(
              height: 130,
            )
          ],
        ),
      ),
    );
  }
}
