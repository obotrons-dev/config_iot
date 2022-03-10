import 'dart:convert';
import 'package:ap_config/json/calibrateapi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

const background = Color(0xFFC1DEAE);
const write = Color(0xFFFAFAFA);
const button = Color(0xFF536DFE);
const grey = Color(0xFF616161);
final ButtonStyle style =
    ElevatedButton.styleFrom(primary: background, textStyle: textstyle);
const textstyle =
    TextStyle(color: grey, fontSize: 20, fontFamily: 'RobotoMono');

class CalibratePage extends StatefulWidget {
  final dynamic snapshot;
  final dynamic str;

  CalibratePage(this.snapshot, this.str);

  @override
  _CalibratePageState createState() => _CalibratePageState();
}

class _CalibratePageState extends State<CalibratePage> {
  TextEditingController off_pm1,
      off_pm2_5,
      off_pm10,
      off_co2,
      off_tvoc,
      off_temp,
      off_humid,
      scale_pm1,
      scale_pm2_5,
      scale_pm10,
      scale_co2,
      scale_tvoc,
      scale_temp,
      scale_humid;
  TextEditingController name;
  List<JsonCalibrate> index = List<JsonCalibrate>();

  List<JsonCalibrate> _foundUsers = [];

  void initState() {
    fetchApi().then((value) {
      setState(() {
        index.addAll(value);
        _foundUsers = index;
      });
    });
    super.initState();
    name = new TextEditingController();
    off_pm1 = new TextEditingController(
        text: '${widget.str.calibrate.pm1.offset} ' ?? '');
    off_pm2_5 = new TextEditingController(
        text: '${widget.str.calibrate.pm25.offset}' ?? '');
    off_pm10 = new TextEditingController(
        text: '${widget.str.calibrate.pm10.offset}' ?? '');
    off_co2 = new TextEditingController(
        text: '${widget.str.calibrate.co2.offset}' ?? '');
    off_tvoc = new TextEditingController(
        text: '${widget.str.calibrate.tvoc.offset}' ?? '');
    off_temp = new TextEditingController(
        text: '${widget.str.calibrate.temp.offset}' ?? '');
    off_humid = new TextEditingController(
        text: '${widget.str.calibrate.humid.offset}' ?? '');
    scale_pm1 = new TextEditingController(
        text: '${widget.str.calibrate.pm1.scale}' ?? '');
    scale_pm2_5 = new TextEditingController(
        text: '${widget.str.calibrate.pm25.scale}' ?? '');
    scale_pm10 = new TextEditingController(
        text: '${widget.str.calibrate.pm10.scale}' ?? '');
    scale_co2 = new TextEditingController(
        text: '${widget.str.calibrate.co2.scale}' ?? '');
    scale_tvoc = new TextEditingController(
        text: '${widget.str.calibrate.tvoc.scale}' ?? '');
    scale_temp = new TextEditingController(
        text: '${widget.str.calibrate.temp.scale}' ?? '');
    scale_humid = new TextEditingController(
        text: '${widget.str.calibrate.humid.scale}' ?? '');
  }

  saveCalibrate() async {
    var calibrate = {
      "name": name.text,
      "calibrate": {
        "pm1": {"offset": off_pm1.text, "scale": scale_pm1.text},
        "pm2.5": {"offset": off_pm2_5.text, "scale": scale_pm2_5.text},
        "pm10": {"offset": off_pm10.text, "scale": scale_pm10.text},
        "co2": {"offset": off_co2.text, "scale": scale_co2.text},
        "tvoc": {"offset": off_tvoc.text, "scale": scale_tvoc.text},
        "temp": {"offset": off_temp.text, "scale": scale_temp.text},
        "humid": {"offset": off_humid.text, "scale": scale_humid.text}
      }
    };
    String json = jsonEncode(calibrate);
    if (name.text == '') {
      EasyLoading.showError("please input name");
    } else {
      var url =
          "http://${widget.snapshot.data.hWIP}/loadCalibrate?data=${json}";
      var response = await http.get(Uri.parse(url));
      var src = "http://api.arduino.obotrons.net/api/calibrate.php";
      var res = await http.post(Uri.parse(src), body: json);
      if (res.statusCode == 200) {
        EasyLoading.showSuccess("Success");
        Navigator.pop(context);
      } else {
        EasyLoading.showError("fail");
      }
    }
  }

  LoadCalibratefromServer(json) {
    setState(() {
      name = new TextEditingController(text: '${json.name}');
      off_pm1 = new TextEditingController(
          text: '${json.calibrate.pm1.offset} ' ?? '');
      off_pm2_5 = new TextEditingController(
          text: '${json.calibrate.pm25.offset}' ?? '');
      off_pm10 = new TextEditingController(
          text: '${json.calibrate.pm10.offset}' ?? '');
      off_co2 =
          new TextEditingController(text: '${json.calibrate.co2.offset}' ?? '');
      off_tvoc = new TextEditingController(
          text: '${json.calibrate.tvoc.offset}' ?? '');
      off_temp = new TextEditingController(
          text: '${json.calibrate.temp.offset}' ?? '');
      off_humid = new TextEditingController(
          text: '${json.calibrate.humid.offset}' ?? '');
      scale_pm1 =
          new TextEditingController(text: '${json.calibrate.pm1.scale}' ?? '');
      scale_pm2_5 =
          new TextEditingController(text: '${json.calibrate.pm25.scale}' ?? '');
      scale_pm10 =
          new TextEditingController(text: '${json.calibrate.pm10.scale}' ?? '');
      scale_co2 =
          new TextEditingController(text: '${json.calibrate.co2.scale}' ?? '');
      scale_tvoc =
          new TextEditingController(text: '${json.calibrate.tvoc.scale}' ?? '');
      scale_temp =
          new TextEditingController(text: '${json.calibrate.temp.scale}' ?? '');
      scale_humid = new TextEditingController(
          text: '${json.calibrate.humid.scale}' ?? '');
    });
  }

  Future<List<JsonCalibrate>> fetchApi() async {
    var url = 'http://api.arduino.obotrons.net/api/calibrate.php';
    var response = await http.get(Uri.parse(url));
    List jsonResponse = json.decode(response.body);

    return jsonResponse
        .map((json) => new JsonCalibrate.fromJson(json))
        .toList();
  }

  Future<void> dialogconfirm() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('save calibrate'),
            content: SizedBox(
              height: 100,
              width: double.infinity,
              child: Column(
                children: [
                  TextField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: 'name',
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFE64A19),
                    textStyle: const TextStyle(fontSize: 20, color: write)),
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF388E3C),
                    textStyle: const TextStyle(fontSize: 20, color: write)),
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    saveCalibrate();
                  });
                },
              ),
            ],
          );
        });
  }

  Widget setupAlertDialoadContainer() {
    return Container(
      height: 450.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _foundUsers.length,
        itemBuilder: (BuildContext context, int snapshot) {
          JsonCalibrate json = _foundUsers[snapshot];
          return ListTile(
            title:Column(
              children: [
                GestureDetector(
                  onTap: () {
                    LoadCalibratefromServer(json);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${snapshot + 1}. ${json.name}',
                            style: TextStyle(
                                color: grey,
                                fontSize: 12,
                                fontFamily: 'RobotoMono')),
                        Row(
                          children: [
                            Text(
                                '${json.calibrate.pm1.offset}' != ''
                                    ? 'pm1: offset = ${json.calibrate.pm1.offset.replaceAll(" ", '')} '
                                    : 'pm1: offset = 0 ',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                            Text(
                                '${json.calibrate.pm1.scale}' != ''
                                    ? 'scale = ${json.calibrate.pm1.scale} '
                                    : 'scale = 0',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                '${json.calibrate.pm25.offset}' != ''
                                    ? 'pm25: offset = ${json.calibrate.pm25.offset} '
                                    : 'pm25:offset = 0 ',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                            Text(
                                '${json.calibrate.pm25.scale}' != ''
                                    ? 'scale = ${json.calibrate.pm25.scale}'
                                    : 'scale = 0',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                '${json.calibrate.pm10.offset}' != ''
                                    ? 'pm10: offset = ${json.calibrate.pm10.offset} '
                                    : 'pm10: offset = 0 ',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                            Text(
                                '${json.calibrate.pm10.scale}' != ''
                                    ? 'scale = ${json.calibrate.pm10.scale}'
                                    : 'scale = 0',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                '${json.calibrate.co2.offset}' != ''
                                    ? 'co2: offset = ${json.calibrate.co2.offset} '
                                    : 'co2: offset = 0 ',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                            Text(
                                '${json.calibrate.co2.scale}' != ''
                                    ? 'scale =${json.calibrate.co2.scale}'
                                    : 'scale = 0',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                '${json.calibrate.tvoc.offset}' != ''
                                    ? 'tvoc: offset = ${json.calibrate.tvoc.offset} '
                                    : 'tvoc: offset = 0 ',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                            Text(
                                '${json.calibrate.co2.scale}' != ''
                                    ? 'scale =${json.calibrate.co2.scale}'
                                    : 'scale = 0',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                '${json.calibrate.temp.offset}' != ''
                                    ? 'temp: offset = ${json.calibrate.temp.offset} '
                                    : 'temp: offset = 0 ',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                            Text(
                                '${json.calibrate.temp.scale}' != ''
                                    ? 'scale =${json.calibrate.temp.scale}'
                                    : 'scale = 0',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                '${json.calibrate.humid.offset}' != ''
                                    ? 'humid: offset = ${json.calibrate.humid.offset} '
                                    : 'humid: offset = 0 ',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                            Text(
                                '${json.calibrate.humid.scale}' != ''
                                    ? 'scale =${json.calibrate.humid.scale}'
                                    : 'scale = 0',
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 12,
                                    fontFamily: 'RobotoMono')),
                          ],
                        )
                      ],
                    ) ,
                  )
                )
              ],
            )
          );
        },
      ),
    );
    return Column(
      children: [
        ListView.builder(
          itemCount: _foundUsers.length,
          itemBuilder: (context, int snapshot) {
            JsonCalibrate json = _foundUsers[snapshot];
            return
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    LoadCalibratefromServer(json);
                    Navigator.pop(context);
                  },
                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text('${snapshot + 1}. ${json.name}',
                  //         style: TextStyle(
                  //             color: grey,
                  //             fontSize: 12,
                  //             fontFamily: 'RobotoMono')),
                  //     Row(
                  //       children: [
                  //         Text(
                  //             '${json.calibrate.pm1.offset}' != ''
                  //                 ? 'pm1: offset = ${json.calibrate.pm1.offset.replaceAll(" ", '')} '
                  //                 : 'pm1: offset = 0 ',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //         Text(
                  //             '${json.calibrate.pm1.scale}' != ''
                  //                 ? 'scale = ${json.calibrate.pm1.scale} '
                  //                 : 'scale = 0',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         Text(
                  //             '${json.calibrate.pm25.offset}' != ''
                  //                 ? 'pm25: offset = ${json.calibrate.pm25.offset} '
                  //                 : 'pm25:offset = 0 ',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //         Text(
                  //             '${json.calibrate.pm25.scale}' != ''
                  //                 ? 'scale = ${json.calibrate.pm25.scale}'
                  //                 : 'scale = 0',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         Text(
                  //             '${json.calibrate.pm10.offset}' != ''
                  //                 ? 'pm10: offset = ${json.calibrate.pm10.offset} '
                  //                 : 'pm10: offset = 0 ',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //         Text(
                  //             '${json.calibrate.pm10.scale}' != ''
                  //                 ? 'scale = ${json.calibrate.pm10.scale}'
                  //                 : 'scale = 0',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         Text(
                  //             '${json.calibrate.co2.offset}' != ''
                  //                 ? 'co2: offset = ${json.calibrate.co2.offset} '
                  //                 : 'co2: offset = 0 ',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //         Text(
                  //             '${json.calibrate.co2.scale}' != ''
                  //                 ? 'scale =${json.calibrate.co2.scale}'
                  //                 : 'scale = 0',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         Text(
                  //             '${json.calibrate.tvoc.offset}' != ''
                  //                 ? 'tvoc: offset = ${json.calibrate.tvoc.offset} '
                  //                 : 'tvoc: offset = 0 ',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //         Text(
                  //             '${json.calibrate.co2.scale}' != ''
                  //                 ? 'scale =${json.calibrate.co2.scale}'
                  //                 : 'scale = 0',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         Text(
                  //             '${json.calibrate.temp.offset}' != ''
                  //                 ? 'temp: offset = ${json.calibrate.temp.offset} '
                  //                 : 'temp: offset = 0 ',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //         Text(
                  //             '${json.calibrate.temp.scale}' != ''
                  //                 ? 'scale =${json.calibrate.temp.scale}'
                  //                 : 'scale = 0',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         Text(
                  //             '${json.calibrate.humid.offset}' != ''
                  //                 ? 'humid: offset = ${json.calibrate.humid.offset} '
                  //                 : 'humid: offset = 0 ',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //         Text(
                  //             '${json.calibrate.humid.scale}' != ''
                  //                 ? 'scale =${json.calibrate.humid.scale}'
                  //                 : 'scale = 0',
                  //             style: TextStyle(
                  //                 color: grey,
                  //                 fontSize: 12,
                  //                 fontFamily: 'RobotoMono')),
                  //       ],
                  //     )
                  //   ],
                  // ),
                )
              ],
            );
          },
        ),
      ],
    );
  }

  Future<void> dialogLoadcalibrate() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('List Calibrate'),
            content: SingleChildScrollView(
              child: setupAlertDialoadContainer(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: write),
          elevation: 0,
          backgroundColor: background,
        ),
        body: Container(
          height: double.infinity,
          color: background,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Calibrate", style: textstyle),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: write,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(75.0))),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text('PM1'),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 120.0,
                                  child: Form(
                                    autovalidateMode: AutovalidateMode.always,
                                    child: TextFormField(
                                      controller: off_pm1,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5.0),
                                        border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        labelText: 'offset',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120.0,
                              child: Form(
                                autovalidateMode: AutovalidateMode.always,
                                child: TextFormField(
                                  controller: scale_pm1,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5.0),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelText: 'scale',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text('PM2.5'),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 120.0,
                                  child: Form(
                                    autovalidateMode: AutovalidateMode.always,
                                    child: TextFormField(
                                      controller: off_pm2_5,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5.0),
                                        border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        labelText: 'offset',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120.0,
                              child: Form(
                                autovalidateMode: AutovalidateMode.always,
                                child: TextFormField(
                                  controller: scale_pm2_5,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5.0),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelText: 'scale',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text('PM10'),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 120.0,
                                  child: Form(
                                    autovalidateMode: AutovalidateMode.always,
                                    child: TextFormField(
                                      controller: off_pm10,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5.0),
                                        border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        labelText: 'offset',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120.0,
                              child: Form(
                                autovalidateMode: AutovalidateMode.always,
                                child: TextFormField(
                                  controller: scale_pm10,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5.0),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelText: 'scale',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text('Co2'),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 120.0,
                                  child: Form(
                                    autovalidateMode: AutovalidateMode.always,
                                    child: TextFormField(
                                      controller: off_co2,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5.0),
                                        border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        labelText: 'offset',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120.0,
                              child: Form(
                                autovalidateMode: AutovalidateMode.always,
                                child: TextFormField(
                                  controller: scale_co2,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5.0),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelText: 'scale',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text('TVOC'),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 120.0,
                                  child: Form(
                                    autovalidateMode: AutovalidateMode.always,
                                    child: TextFormField(
                                      controller: off_tvoc,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5.0),
                                        border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        labelText: 'offset',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120.0,
                              child: Form(
                                autovalidateMode: AutovalidateMode.always,
                                child: TextFormField(
                                  controller: scale_tvoc,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5.0),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelText: 'scale',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text('Temp'),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 120.0,
                                  child: Form(
                                    autovalidateMode: AutovalidateMode.always,
                                    child: TextFormField(
                                      controller: off_temp,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5.0),
                                        border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        labelText: 'offset',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120.0,
                              child: Form(
                                autovalidateMode: AutovalidateMode.always,
                                child: TextFormField(
                                  controller: scale_temp,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5.0),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelText: 'offset',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text('Humid'),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 120.0,
                                  child: Form(
                                    autovalidateMode: AutovalidateMode.always,
                                    child: TextFormField(
                                      controller: off_humid,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5.0),
                                        border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        labelText: 'offset',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120.0,
                              child: Form(
                                autovalidateMode: AutovalidateMode.always,
                                child: TextFormField(
                                  controller: scale_humid,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5.0),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelText: 'scale',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: ElevatedButton(
                                  onPressed: () {
                                    dialogLoadcalibrate();
                                  },
                                  child: Text("LoadCalibrate"),
                                  style: style,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: ElevatedButton(
                                  onPressed: () {
                                    dialogconfirm();
                                  },
                                  child: Text("Save"),
                                  style: style,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
