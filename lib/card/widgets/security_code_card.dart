import 'package:flutter/material.dart';

class SecurityCodeCard extends StatelessWidget {
  final double height;
  final String securityCode;
  final Color colorText;

  const SecurityCodeCard({
    super.key,
    required this.height,
    required this.securityCode,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: height,
      color: colorText,
      child: Center(
          child: Text(
        securityCode,
        style: TextStyle(
          color: colorText,
          fontSize: 18,
          fontFamily: 'CourrierPrime',
        ),
      )),
    );
  }
}
