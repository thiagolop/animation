import 'package:flutter/material.dart';

import 'card/widgets/build_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Offset location = Offset.zero;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    const height = 256.0;
    final width = screenSize.width > 400 ? 400.0 : screenSize.width * 0.9;
    const cardHeight = height - 7;
    final cardWidth = width - 7;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Swipe to see more',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 256,
                width: width,
                decoration: const BoxDecoration(
                  gradient: SweepGradient(
                    colors: [
                      Colors.red,
                      Colors.yellow,
                      Colors.green,
                      Colors.blue,
                      Colors.red,
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateX(0.005 * location.dy)
                  ..rotateY(-0.005 * location.dx),
                child: GestureDetector(
                  onPanUpdate: (details) {
                    location += details.delta;
                    setState(() {});
                  },
                  onPanEnd: (details) {
                    location = Offset.zero;
                    setState(() {});
                  },
                  child: CreditCardPage(
                    cardHeight: cardHeight,
                    cardWidth: cardWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
