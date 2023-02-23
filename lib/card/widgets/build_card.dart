import 'package:flutter/material.dart';
import 'build_card_credito.dart';

class CreditCardPage extends StatelessWidget {
  final  double cardHeight;
  final double cardWidth;
  const CreditCardPage({Key? key, required this.cardHeight, required this.cardWidth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      width: cardWidth,
      padding: const EdgeInsets.all(1),
      child: const BuidCreditCard(color: Color(0xFF090943), cardExpiration: '08/2026', cardHolder: 'THIAGO F LOPES', cardNumber: '1234 5678 XXXX 9101'),
    );
  }
}
