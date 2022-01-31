// import 'dart:async';
// import 'dart:convert';
// import 'package:ap_config/json/data.dart';
// import 'package:ap_config/json/formdata.dart';
// import 'package:ap_config/page/calibrate.dart';
// import 'package:ap_config/page/checkConfigApi.dart';
// import 'package:ap_config/page/checkConfigMQTT.dart';
// import 'package:ap_config/page/checkData.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:ap_config/json/qrcodeApi.dart';
// import 'package:wifi/wifi.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'dart:developer';
// import 'dart:io';
//
// const background = Color(0xFFFEF5ED);
// const font = Color(0xFF99A799);
// const button = Color(0xFF99A799);
// final ButtonStyle style = ElevatedButton.styleFrom(
//     primary: button, textStyle: const TextStyle(fontSize: 20, color: font));
//
// class ScanMacIOS extends StatefulWidget {
//   const ScanMacIOS({Key key}) : super(key: key);
//
//   @override
//   _ScanMacIOSState createState() => _ScanMacIOSState();
// }
//
// class _ScanMacIOSState extends State<ScanMacIOS> {
//   String resultScan;
//   Future<IAQ> futureAlbum;
//   Future<Formdata> form;
//   String url = '';
//   bool scan = false;
//   String result = "", currentPass = '';
//   String ssid = '', password = '';
//   bool done = false, success = false;
//   TextEditingController wifi_ssid;
//   TextEditingController wifi_pwd;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode resultt;
//   QRViewController controller;
//
//   Future<IAQ> fetchAlbum() async {
//     String camerascanresult = await scanner.scan();
//     setState(() {
//       resultScan = camerascanresult;
//       scan = true;
//     });
//     Map<String, String> requestheader = {
//       'MsgClient-RequestFrom': "OBT_Application-Service",
//       'MsgClient-ListParameters': "IOT-IAQ"
//     };
//
//     http.Response response = await http.get(
//         Uri.parse(
//             'http://cloud.risc.dtgsiam.com:8080/CloudDataStorage/RiscServiceIAQ/DBData/JSONreport/test.json?IAQ_ID=${this.resultScan}&SelectedBy=Room&SelectedTime=Now'),
//         headers: requestheader);
//
//     if (response.statusCode == 200) {
//       return IAQ.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//     // form = checkData(widget);
//     wifi_pwd = new TextEditingController();
//   }
//
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller.pauseCamera();
//     }
//     controller.resumeCamera();
//   }
//
//   Future<void> dialogConnect(AsyncSnapshot<IAQ> snapshot) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Connect Wifi ${snapshot.data.IAQSSID}'),
//             content: SizedBox(
//               height: 150,
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   TextField(
//                     decoration: InputDecoration(hintText: 'ssid'),
//                     controller: wifi_ssid = new TextEditingController(
//                         text: '${snapshot.data.IAQSSID}'),
//                   ),
//                   TextField(
//                     decoration: InputDecoration(hintText: 'password'),
//                     controller: wifi_pwd,
//                   )
//                 ],
//               ),
//             ),
//             actions: <Widget>[
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: Color(0xFFE64A19), textStyle: const TextStyle(fontSize: 20, color: font)) ,
//                 child: Text('CANCEL'),
//                 onPressed: () {
//                   setState(() {
//                     Navigator.pop(context);
//                   });
//                 },
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: Color(0xFF388E3C), textStyle: const TextStyle(fontSize: 20, color: font)) ,
//                 child: Text('OK'),
//                 onPressed: () {
//                   setState(() {
//                     connection();
//                     Navigator.pop(context);
//                   });
//                 },
//               ),
//             ],
//           );
//         });
//   }
//
//   Future<void> dialogReset(AsyncSnapshot<IAQ> snapshot) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Confirm to reset board'),
//             content: SizedBox(
//               height: 10,
//               width: double.infinity,
//               child: Column(
//               ),
//             ),
//             actions: <Widget>[
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: Color(0xFFE64A19), textStyle: const TextStyle(fontSize: 20, color: font)) ,
//                 child: Text('CANCEL'),
//                 onPressed: () {
//                   setState(() {
//                     Navigator.pop(context);
//                   });
//                 },
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: Color(0xFF388E3C), textStyle: const TextStyle(fontSize: 20, color: font)) ,
//                 child: Text('OK'),
//                 onPressed: () {
//                   setState(() {
//                     reset(snapshot);
//                     Navigator.pop(context);
//                   });
//                 },
//               ),
//             ],
//           );
//         });
//   }
//
//   reset(snapshot) async{
//
//     var url = "http://${snapshot.data.hWIP}/resetConfig";
//     var response = await http.get(Uri.parse(url));
//     if(response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Container(height: 30,
//         padding: EdgeInsets.only(top:5),
//         child: Text("reset Complete",style: TextStyle(color:background,fontSize: 14),textAlign: TextAlign.center,),
//       ),
//         duration: const Duration(milliseconds: 2000),
//         padding: const EdgeInsets.symmetric(
//           horizontal: 8.0, // Inner padding for SnackBar content.
//         ),
//         width: 250,
//         backgroundColor: font,
//         behavior: SnackBarBehavior.floating,));
//     }
//   }
//
//   checkConfig(snapshot) async{
//
//     var url = "http://${snapshot.data.hWIP}/checkConfig";
//     var response = await http.get(Uri.parse(url));
//     var json = jsonDecode(response.body);
//     if(response.statusCode == 200){
//       var str = DataSetting.fromJson(jsonDecode(response.body));
//       if(str.config.type == 'api'){
//         Navigator.
//         push(
//             context, MaterialPageRoute(builder: (context) => CheckConfigAPI(str)));
//       }
//       if(str.config.type == 'mqtt'){
//         Navigator.
//         push(
//             context, MaterialPageRoute(builder: (context) => CheckConfigMQTT(str)));
//       }
//
//     }
//
//   }
//   Future<Formdata> checkData(snapshot) async{
//
//     var url = "http://${snapshot.data.hWIP}/checkData";
//     var response = await http.get(Uri.parse(url));
//     var json = jsonDecode(response.body);
//     if(response.statusCode == 200){
//       var str = Formdata.fromJson(jsonDecode(response.body));
//       Navigator.
//       push(
//           context, MaterialPageRoute(builder: (context) => CheckData(str)));
//     }
//   }
//
//   Future<void> dialogUpdate(AsyncSnapshot<IAQ> snapshot) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Confirm to update ota'),
//             content: SizedBox(
//               height: 10,
//               width: double.infinity,
//               child: Column(
//               ),
//             ),
//             actions: <Widget>[
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: Color(0xFFE64A19), textStyle: const TextStyle(fontSize: 20, color: font)) ,
//                 child: Text('CANCEL'),
//                 onPressed: () {
//                   setState(() {
//                     Navigator.pop(context);
//                   });
//                 },
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: Color(0xFF388E3C), textStyle: const TextStyle(fontSize: 20, color: font)) ,
//                 child: Text('OK'),
//                 onPressed: () {
//                   setState(() {
//                     otaUpdate(snapshot);
//                     Navigator.pop(context);
//                   });
//                 },
//               ),
//             ],
//           );
//         });
//   }
//
//   otaUpdate(snapshot) async{
//
//     var url = "http://${snapshot.data.hWIP}/otaUpdate";
//     var response = await http.get(Uri.parse(url));
//     var json = jsonEncode(response.body);
//
//   }
//
//   Widget dataQrcode(context) {
//     if (resultScan != null) {
//       return FutureBuilder<IAQ>(
//         future: futureAlbum,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Container(
//               child: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     height: double.infinity,
//                     width: double.infinity,
//                     child: Column(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Mac Address :${snapshot.data.hWMAC}' ??
//                                     "ไม่มีข้อมูล",
//                                 style: TextStyle(fontSize: 20,color: font),
//                               ),
//                               Text(
//                                   'IP Address :${snapshot.data.hWIP}' ??
//                                       "ไม่มีข้อมูล",
//                                   style: TextStyle(fontSize: 20,color:font)),
//                               Text(
//                                   'IAQ SSID :${snapshot.data.IAQSSID}' ??
//                                       "ไม่มีข้อมูล",
//                                   style: TextStyle(fontSize: 20,color:font)),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () {
//                                   dialogConnect(snapshot);
//                                 },
//                                 child: Text(
//                                     "connect to " '${snapshot.data.IAQSSID}',style: TextStyle(fontSize: 15),),
//                                 style: style,
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   GestureDetector(
//                                     onTap:() {
//                                       checkConfig(snapshot);
//                                     },
//                                     child:Container(
//                                       width: 300,
//                                       height: 100,
//                                       decoration: BoxDecoration(
//                                         borderRadius: new BorderRadius.circular(20.0),
//                                         color: font,
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsets.all(30),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text("Check Config",style: TextStyle(fontSize: 20,fontFamily: 'RobotoMono', color: background),),
//                                             Container(
//                                               width: 50,
//                                               color: font,
//                                               child: Icon(Icons.settings,color: background),
//                                             ),
//                                           ],),
//                                       ),
//                                     ),),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   GestureDetector(
//                                     onTap:() {
//                                       checkData(snapshot);
//                                     },
//                                     child:Container(
//                                       width: 300,
//                                       height: 100,
//                                       decoration: BoxDecoration(
//                                         borderRadius: new BorderRadius.circular(20.0),
//                                         color: font,
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsets.all(30),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text("Check Data",style: TextStyle(fontSize: 20,fontFamily: 'RobotoMono', color: background),),
//                                             Container(
//                                               width: 50,
//                                               color: font,
//                                               child: Icon(Icons.settings,color: background),
//                                             ),
//                                           ],),
//                                       ),
//                                     ),),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   GestureDetector(
//                                     onTap:() {
//                                       dialogUpdate(snapshot);
//                                     },
//                                     child:Container(
//                                       width: 300,
//                                       height: 100,
//                                       decoration: BoxDecoration(
//                                         borderRadius: new BorderRadius.circular(20.0),
//                                         color: font,
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsets.all(30),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text("OTA Update",style: TextStyle(fontSize: 20,fontFamily: 'RobotoMono', color: background),),
//                                             Container(
//                                               width: 50,
//                                               color: font,
//                                               child: Icon(Icons.cloud_upload_outlined,color: background),
//                                             ),
//                                           ],),
//                                       ),
//                                     ),),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   GestureDetector(
//                                     onTap:() {
//                                       dialogReset(snapshot);
//                                     },
//                                     child:Container(
//                                       width: 300,
//                                       height: 100,
//                                       decoration: BoxDecoration(
//                                         borderRadius: new BorderRadius.circular(20.0),
//                                         color: font,
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsets.all(30),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text("Reset board",style: TextStyle(fontSize: 20,fontFamily: 'RobotoMono', color: background),),
//                                             Container(
//                                               width: 50,
//                                               color: font,
//                                               child: Icon(Icons.swap_horizontal_circle_outlined,color: background),
//                                             ),
//                                           ],),
//                                       ),
//                                     ),),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   GestureDetector(
//                                     onTap:() {
//                                       Navigator.
//                                       push(
//                                           context, MaterialPageRoute(builder: (context) => Calibrate(snapshot)));
//                                     },
//                                     child:Container(
//                                       width: 300,
//                                       height: 100,
//                                       decoration: BoxDecoration(
//                                         borderRadius: new BorderRadius.circular(20.0),
//                                         color: font,
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsets.all(30),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text("Calibrate",style: TextStyle(fontSize: 20,fontFamily: 'RobotoMono', color: background),),
//                                             Container(
//                                               width: 50,
//                                               color: font,
//                                               child: Icon(Icons.calculate,color: background),
//                                             ),
//                                           ],),
//                                       ),
//                                     ),),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ]),
//                   )),
//             );
//           } else if (snapshot.hasError) {
//             return Text('${snapshot.error}');
//           }
//           return const CircularProgressIndicator();
//         },
//       );
//     }else {
//       return Container(
//         child: Text("please check your internet"),
//       );
//     }
//   }
//
//   Future<Null> connection() async {
//     ssid = wifi_ssid.text;
//     password = wifi_pwd.text;
//     Wifi.connection(ssid, password).then((v) {
//       print(v);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: background,
//         iconTheme: IconThemeData(color: font),
//         elevation: 0,
//         title: Text(
//           'QR Scan',
//           style: TextStyle(color: font),
//         ),
//       ),
//       backgroundColor: background,
//       body: Container(
//           child: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQrviewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//                 child: (resultt != null
//                     ? Text(
//                     "Barcode Type : ${describeEnum(resultt.format)} Data : ${resultt.code}")
//                     : const Text("Scan a code"))),
//           ),
//         ],
//       )),
//     );
//
//   }
//
//   Future<IAQ> _onQrviewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) async {
//       setState(() {
//         resultt = scanData;
//         controller.stopCamera();
//       });
//       Map<String, String> requestheader = {
//         'MsgClient-RequestFrom': "OBT_Application-Service",
//         'MsgClient-ListParameters': "IOT-IAQ"
//       };
//
//       http.Response response = await http.get(
//           Uri.parse(
//               'http://cloud.risc.dtgsiam.com:8080/CloudDataStorage/RiscServiceIAQ/DBData/JSONreport/test.json?IAQ_ID=${resultt.code}&SelectedBy=Room&SelectedTime=Now'),
//           headers: requestheader);
//
//       print(response.body);
//
//       if (response.statusCode == 200) {
//         return IAQ.fromJson(jsonDecode(response.body));
//       } else {
//         throw Exception('Failed to load album');
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }
