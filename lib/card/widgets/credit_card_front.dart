import 'package:animation/card/widgets/chip_card.dart';
import 'package:animation/card/widgets/details_card.dart';
import 'package:flutter/material.dart';
import 'number_card.dart';
import 'title_card.dart';
import 'logo_card.dart';

class CreditCardFront extends StatelessWidget {
  final Color? color;
  final Decoration? decoration;
  final String cardNumber;
  final String cardHolder;
  final String bank;
  final CreditCardFlag flag;
  final Color colorText;

  const CreditCardFront({
    super.key,
    this.color,
    this.decoration,
    required this.cardNumber,
    required this.cardHolder,
    required this.bank,
    required this.flag,
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
        color: color == null && decoration == null ? const Color(0xFFFF4000) : null,
        decoration: decoration,
        height: 200,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TitleCard(bank: bank, colorText: colorText),
            const SizedBox(height: 10),
            const ChipCard(),
            NumberCard(cardNumber: cardNumber, colorText: colorText),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DetailsCard(label: 'CARDHOLDER', value: cardHolder, colorText: colorText),
                LogoCard(flag: flag),
              ],
            )
          ],
        ),
      ),
    );
  }
}
