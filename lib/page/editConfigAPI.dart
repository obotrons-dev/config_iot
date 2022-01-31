import 'package:flutter/material.dart';
import 'package:ap_config/json/data.dart';


const background = Color(0xFFFEF5ED);
const font = Color(0xFF99A799);
const button = Color(0xFF99A799);
final ButtonStyle style =
ElevatedButton.styleFrom(primary: button,textStyle: const TextStyle(fontSize: 20,));

class  EditConfig extends StatelessWidget {

  final DataSetting data;
  EditConfig(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          '${data.nameDevice}',
          style: TextStyle(fontSize: 15.0,color: font),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: font),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0),
        child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: TextFormField(
                    initialValue: '${data.config.storage}',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
