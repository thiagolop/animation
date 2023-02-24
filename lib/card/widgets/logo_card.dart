import 'package:flutter/material.dart';

enum CreditCardFlag { mastercard, visa }

class LogoCard extends StatelessWidget {
  final CreditCardFlag flag;
  const LogoCard({super.key, required this.flag});

  String get logo {
    switch (flag) {
      case CreditCardFlag.mastercard:
        return 'assets/imagens/mastercard.png';
      case CreditCardFlag.visa:
        return 'assets/imagens/visa.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      logo,
      height: 60,
      width: 60,
    );
  }
}
