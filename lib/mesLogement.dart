import 'package:flutter/material.dart';
import 'headerPages.dart';

class Meslogement extends StatelessWidget {
  const Meslogement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  //zone header
                  Headerpages(height: 110),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "  Mes Logements",
                        style: TextStyle(
                          fontSize: 25,
                          color: const Color.fromARGB(220, 181, 136, 2),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
