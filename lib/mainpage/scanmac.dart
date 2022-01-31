import 'package:ap_config/page/mac.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


const background = Color(0xFFFEF5ED);
const font = Color(0xFF99A799);
const button = Color(0xFF99A799);
final ButtonStyle style = ElevatedButton.styleFrom(
    primary: button, textStyle: const TextStyle(fontSize: 20, color: font));

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
      Navigator.
      push(
          context, MaterialPageRoute(builder: (context) => MacApp(code)));
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
        iconTheme: IconThemeData(color: font),
        elevation: 0,
        title: Text(
          'QR Scan',
          style: TextStyle(color: font),
        ),
      ),
      backgroundColor: background,
      body: Container(
          child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQrviewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
                child: (resultt != null
                    ? Text(
                    "Barcode Type : ${(resultt.format)} Data : ${resultt.code}")
                    : const Text("Scan a code"))),
          ),
        ],
      )),
    );
  }
}
