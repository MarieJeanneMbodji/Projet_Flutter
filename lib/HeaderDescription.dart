import 'package:flutter/material.dart';
import 'package:page_accueil/main.dart';
import 'package:page_accueil/maisonsPage.dart';

class HeaderDescription extends StatelessWidget {
  final String backgroundImagePath;
  final double height;

  //Constructeur
  const HeaderDescription({
    super.key,
    this.backgroundImagePath = "",
    this.height = 400,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(backgroundImagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset("assets/left-arrow.png", width: 24),
            ),
          ),
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/logo.png", height: 80),
                  ),
                ],
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
                        color: const Color.fromARGB(255, 196, 165, 55),
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

          Positioned(
            top: 30,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [Icon(Icons.favorite, color: Colors.white)],
            ),
          ),
        ],
      ),
    );
  }
}
