import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CollectionQrCodeTradeWidget extends StatelessWidget {
  const CollectionQrCodeTradeWidget(this.collection, this.padding, {super.key});
  final String collection;
  final double padding;

  Widget _openCamera() {
    return MobileScanner(
      onDetect: (result) {
        print(result.barcodes.first.rawValue);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: padding / 4, right: padding / 4),

      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
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
                      version: QrVersions.auto,
                      errorCorrectionLevel: QrErrorCorrectLevel.L,
                    ),
                    Divider(height: 3, thickness: 3),
                    Text(
                      "Escaneie o QR code para ver quais figurinhas pode trocar.",
                    ),
                    Card(
                      shape: CircleBorder(
                        side: BorderSide(
                          color: const Color.fromARGB(255, 213, 247, 255),
                        ),
                      ), //
                      child: InkWell(
                        onTap: () => _openCamera(),
                        child: Icon(Icons.camera),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
