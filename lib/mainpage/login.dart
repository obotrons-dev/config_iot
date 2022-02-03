import 'dart:convert';
import 'package:ap_config/mainpage//home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

const background = Color(0xFFFEF5ED);
const font = Color(0xFF536DFE);
const button = Color(0xFF536DFE);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: button,
    textStyle: const TextStyle(
      fontSize: 20,
    ));

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username, password;
  bool _isObscure = true;

  void initState() {
    super.initState();
    username = new TextEditingController(text: 'admin@123');
    password = new TextEditingController(text: 'password');
  }

  Future login() async {
    try {
      await EasyLoading.show(status: 'loading...');
      var url = "http://api.arduino.obotrons.net/api/login.php";
      var data = {"username": username.text, "password": password.text};
      String body = jsonEncode(data);
      var respones = await http.post(Uri.parse(url), body: body);
      var jsonbody = jsonDecode(respones.body);
      if (jsonbody['msg'] == 'password match') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeApp()));
        EasyLoading.showSuccess('Great Success!');
      } else {
        EasyLoading.showError('Please check your password');
      }
    } on Exception catch (e) {
      EasyLoading.showError('Please check your internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [font, background],
          )),
          child: SingleChildScrollView(
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
                Text("Manage and Config Device",style: TextStyle(fontSize: 20,fontFamily: 'RobotoMono',color: background ),),
                Card(
                    margin: EdgeInsets.all(30),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Padding(
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
                            child: TextField(
                              controller: password,
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
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
                          SizedBox(height: 70),
                          Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)),
                            child: ElevatedButton(
                              style: style,
                              onPressed: login,
                              child: Text(
                                'Login',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
