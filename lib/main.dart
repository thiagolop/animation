import 'package:flutter/material.dart';
import 'card/widgets/logo_card.dart';
import 'credit_card.dart';
import 'credit_card_floating.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credit Card',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CreditCardFloating(
                bank: 'Bank',
                cardExpiration: '12/22',
                cardHolder: 'John Doe',
                cardNumber: '1234 5678 9012 3456',
                securityCode: '123',
                qrCode: '',
                colorText: Colors.white,
                flag: CreditCardFlag.visa,
              ),
              CreditCard(
                bank: 'Bank',
                cardExpiration: '12/22',
                cardHolder: 'John Doe',
                cardNumber: '1234 5678 9012 3456',
                securityCode: '456',
                colorText: Colors.white,
                face: CreditCardFace.front,
                flag: CreditCardFlag.mastercard,
              ),
              CreditCard(
                bank: 'Bank',
                cardExpiration: '12/22',
                cardHolder: 'John Doe',
                cardNumber: '1234 5678 9012 3456',
                securityCode: '789',
                colorText: Colors.white,
                face: CreditCardFace.back,
                flag: CreditCardFlag.visa,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
