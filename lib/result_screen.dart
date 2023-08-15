import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode/qr_scanner.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.code, required this.closeScreen});
  final String code;
  final VoidCallback closeScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            closeScreen();
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'QR Scanner',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  QrImageView(
                    data: code,
                    size: 150,
                    version: QrVersions.auto,
                  ),
                  const Text(
                    'Scranned Result',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    code,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black87, fontSize: 16, letterSpacing: 1),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: code));
                      },
                      child: const Text(
                        'Copy',
                        style: TextStyle(fontSize: 16, letterSpacing: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
