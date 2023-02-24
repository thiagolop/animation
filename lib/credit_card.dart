import 'package:flutter/material.dart';
import 'card/widgets/credit_card_back.dart';
import 'card/widgets/credit_card_front.dart';
import 'card/widgets/logo_card.dart';

enum CreditCardFace { front, back }

class CreditCard extends StatelessWidget {
  final Color? cardcolor;
  final Decoration? decoration;
  final String cardNumber;
  final String cardHolder;
  final String cardExpiration;
  final String bank;
  final CreditCardFace face;
  final Size? size;
  final CreditCardFlag flag;
  final String securityCode;
  final String? qrCode;
  final Color colorText;

  const CreditCard({
    super.key,
    this.cardcolor,
    this.decoration,
    required this.cardNumber,
    required this.cardHolder,
    required this.cardExpiration,
    required this.bank,
    required this.face,
    this.size,
    required this.flag,
    required this.securityCode,
    this.qrCode,
    required this.colorText,
  }) : super();

  Size getCardSize(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    const height = 256.0;
    final width = screenSize.width > 400 ? 400.0 : screenSize.width * 0.9;
    const cardHeight = height - 7;
    final cardWidth = width - 7;
    final Size size = this.size ?? Size(cardWidth, cardHeight);
    return size;
  }

  Decoration? getDecoration() {
    if (decoration != null) return decoration;
    if (cardcolor != null) return null;
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFA1A1A1),
          Color(0xFF777777),
          Color(0xFF404040),
          Color(0xFF1F1F1F),
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(4, 8),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = getCardSize(context);

    return Container(
      height: size.height,
      width: size.width,
      padding: const EdgeInsets.all(1),
      child: Visibility(
        visible: face == CreditCardFace.front,
        replacement: CreditCardBack(
          cardExpiration: cardExpiration,
          color: cardcolor,
          decoration: getDecoration(),
          size: size,
          securityCode: securityCode,
          qrCode: qrCode,
          colorText: colorText,
        ),
        child: CreditCardFront(
          colorText: colorText,
          color: cardcolor,
          decoration: getDecoration(),
          cardNumber: cardNumber,
          cardHolder: cardHolder,
          bank: bank,
          flag: flag,
        ),
      ),
    );
  }
}
