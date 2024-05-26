import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Example'),
      ),
      body: Center(
        child: QrImageView(
          data: "www.google.com",
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
  }
}
