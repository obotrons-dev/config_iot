import 'dart:convert';
import 'package:ap_config/page/managedevice.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ap_config/json/getip.dart';


const background = Color(0xFFFEF5ED);
const font = Color(0xFF99A799);
const button = Color(0xFF99A799);
final ButtonStyle style =
ElevatedButton.styleFrom(primary: button,textStyle: const TextStyle(fontSize: 20,));

class ScanIP extends StatefulWidget {
  const ScanIP({Key key}) : super(key: key);

  @override
  _ScanIPState createState() => _ScanIPState();
}

class _ScanIPState extends State<ScanIP> {

  List<GetIP> index = [];
  TextEditingController controller = new TextEditingController();

  Future<List<GetIP>> fetchApi() async {
    var url = 'http://api.arduino.obotrons.net/mac.json';
    var response = await http.get(Uri.parse(url));
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((json) => new GetIP.fromJson(json)).toList();

  }
  List<GetIP> _data = [];
  @override
  void initState() {
    fetchApi().then(
          (value) {
        setState(() {
          index.addAll(value);
          _data = index;
        });
      },
    );
    super.initState();
  }

  void _search(String enterKeyword) {
    List<GetIP> result = [];
    if (enterKeyword.isEmpty) {
      result = index;
    } else {
      result = index
          .where((name) =>
      name.ip.toLowerCase().contains(enterKeyword.toLowerCase()) ||
          name.mac.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      //index = result;
      _data = result;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          elevation: 0,
          iconTheme: IconThemeData(color: font),
        ),
        body: SingleChildScrollView(
            child:Column(
              children: [
                TextField(
                  cursorColor: Colors.red,
                  textAlign: TextAlign.center,
                  controller: controller,
                  onChanged: (value) => _search(value),
                  decoration: InputDecoration(
                      hintText: 'ค้นหา',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 25,vertical: 13),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          controller.clear();
                        },
                      )),
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _data.length,
                    itemBuilder: (BuildContext context, int snapshot) {
                      GetIP data = _data[snapshot];
                      return Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(color: font),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            leading: Container(
                                padding: EdgeInsets.only(right: 12.0),
                                decoration: new BoxDecoration(
                                    border: new Border(
                                        right: new BorderSide(width: 1.0, color: Colors.white24))),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(Icons.wifi, size: 16),
                                      ),
                                      TextSpan(
                                        text: '${data.ssid}',
                                      ),
                                    ],
                                  ),
                                )
                            ),
                            title: Text(
                              'IP Address : ${data.ip}' ?? 'null',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                            subtitle: Row(
                              children: <Widget>[
                                Text('Mac Address : ${data.mac}' ?? 'null', style: TextStyle(color: Colors.white))
                              ],
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManageDevice(data)));
                            },
                          ),
                        ),
                      );
                    }
                ),
              ],)
        )
    );
  }
}
