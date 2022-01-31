import 'package:ap_config/json/getip.dart';
import 'package:flutter/material.dart';


const background = Color(0xFFFEF5ED);
const font = Color(0xFF99A799);
const button = Color(0xFF99A799);
final ButtonStyle style =
ElevatedButton.styleFrom(primary: button,textStyle: const TextStyle(fontSize: 16,color: font));


class ManageDevice extends StatelessWidget {

  final GetIP data;
  ManageDevice(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        iconTheme: IconThemeData(color: font),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed:(){

              }, child: Text("Reset"),
                style: style,
              ),
              ElevatedButton(onPressed:(){

              }, child: Text("LoadConfig"),
                style: style,
              ),
              ElevatedButton(onPressed:(){

              }, child: Text("LoadData"),
                style: style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
