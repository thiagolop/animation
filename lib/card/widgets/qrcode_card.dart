import 'package:flutter/material.dart';

class QrcodeCard extends StatelessWidget {
  final String qrCode;
  const QrcodeCard({
    super.key,
    required this.qrCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Center(
        child: Image.asset(
          'assets/imagens/QRCode.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
