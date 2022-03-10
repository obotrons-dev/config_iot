import 'package:ap_config/page/mac.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


const background = Color(0xFFC1DEAE);
const write = Color(0xFFFAFAFA);
const button = Color(0xFF536DFE);
const grey = Color(0xFF616161);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: background,
    textStyle: const TextStyle(
      fontSize: 20,
    ));


class ScanMac extends StatefulWidget {
  const ScanMac({Key key}) : super(key: key);

  @override
  _ScanMacState createState() => _ScanMacState();
}

class _ScanMacState extends State<ScanMac> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode resultt;
  QRViewController controller;



  void _onQrviewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        resultt = scanData;
        controller.stopCamera();
      });
      var code = resultt.code;
      if(code.length == 12){
        Navigator.
        push(
            context, MaterialPageRoute(builder: (context) => MacApp(code)));
      }else{
        EasyLoading.showError('Please try again is not Mac address');
        setState(() {
          controller.resumeCamera();
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        iconTheme: IconThemeData(color: write),
        elevation: 0,
        title: Text(
          'QR Scan',
          style: TextStyle(color: write),
        ),
      ),
      body: Container(
          height: double.infinity,
          child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQrviewCreated,
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Center(
          //       child: (resultt != null
          //           ? Text(
          //           "Barcode Type : ${(resultt.format)} Data : ${resultt.code}")
          //           : const Text("Scan a code"))),
          // ),
        ],
      )),
    );
  }
}
