import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CollectionQrCode extends StatelessWidget {
  const CollectionQrCode(this.collection, this.padding, {super.key});
  final String collection;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: padding, right: padding),
      child: Card(
        color: Color.fromRGBO(30, 43, 57, 1),
        shadowColor: Color.fromRGBO(52, 74, 97, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: padding),
            Expanded(
              child: Column(
                children: [
                  Text("Collection QR Code"),
                  Card(
                    color: Colors.white,
                    child: QrImageView(
                      data: collection,
                      size: 280,
                      version: QrVersions
                          .auto, // Automatically scales up the matrix size up to version 40
                      errorCorrectionLevel: QrErrorCorrectLevel.L,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
