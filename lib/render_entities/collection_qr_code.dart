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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "QR Code de troca",
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              QrImageView(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                data: collection,
                size: 120,
                version: QrVersions
                    .auto, // Automatically scales up the matrix size up to version 40
                errorCorrectionLevel: QrErrorCorrectLevel.L,
              ),
              Divider(height: 3, thickness: 3,),
              Text(
                "Escaneie o QR code para ver quais figurinhas pode trocar."
              )
            ],
          ),
        ),
      ),
    );
  }
}
