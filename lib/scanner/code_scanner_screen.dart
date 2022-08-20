import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CodeScannerScreen extends StatelessWidget {
  const CodeScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        allowDuplicates: false,
        onDetect: (barcode, arguments) {
          if (barcode.rawValue != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(barcode.rawValue!)));
            print(barcode.rawValue);
          } else {
            // TODO: Do something with scanned code
          }
        },
      ),
    );
  }
}
