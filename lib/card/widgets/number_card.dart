import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  final String cardNumber;
  final Color colorText;
  const NumberCard({
    super.key,
    required this.cardNumber,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        cardNumber,
        style: TextStyle(
          color: colorText,
          fontSize: 22,
          fontFamily: 'CourrierPrime',
        ),
      ),
    );
  }
}
