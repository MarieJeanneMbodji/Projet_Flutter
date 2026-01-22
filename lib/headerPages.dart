import 'package:flutter/material.dart';

class Headerpages extends StatelessWidget {
  final double height;

  const Headerpages({super.key, this.height = 200});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -20,
              left: 0,
              right: 0,
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/logo.png", height: 80),
                ),
              ),
            ),

            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Sen",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 196, 165, 55),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "DeukouWaay",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
