import 'package:animation/card/widgets/details_card.dart';
import 'package:animation/card/widgets/qrcode_card.dart';
import 'package:flutter/material.dart';
import 'magnetic_stripe_card.dart';
import 'security_code_card.dart';

class CreditCardBack extends StatelessWidget {
  final Color? color;
  final Decoration? decoration;
  final String cardExpiration;
  final Size size;
  final String securityCode;
  final String? qrCode;
  final Color colorText;

  const CreditCardBack({
    super.key,
    this.color,
    this.decoration,
    required this.cardExpiration,
    required this.size,
    required this.securityCode,
    this.qrCode,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        color: color == null && decoration == null ? const Color(0xFFffd700) : null,
        decoration: decoration,
        height: 200,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 60),
              child: Align(
                alignment: Alignment.centerRight,
                child: qrCode != null ? QrcodeCard(qrCode: qrCode!) : Container(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 60),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SecurityCodeCard(height: size.height, securityCode: securityCode, colorText: colorText),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 130.0, right: 16.0, left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: DetailsCard(label: 'VALID THRU', value: cardExpiration, colorText: colorText),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MagneticStripe(height: size.height),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
