import 'package:flutter/material.dart';

class ChipCard extends StatelessWidget {
  const ChipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 55,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Center(
            child: Image.asset(
              'assets/imagens/chip.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(3.1415926535897932 / 1),
          child: Image.asset(
            'assets/imagens/contact_less.png',
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }
}
