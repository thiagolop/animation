import 'package:flutter/material.dart';

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
                  child: Container(
                    height: cardHeight,
                    width: cardWidth,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade500,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 40),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 20,
                                  width: 80 * 2,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  height: 20,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
