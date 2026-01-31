import 'package:flutter/material.dart';
import 'headerPages.dart';
import 'HeaderInscription.dart';

class Pageinscription extends StatelessWidget {
  const Pageinscription({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // hearder
            Headerinscription(
              backgroundImagePath: "assets/house.png",
              height: height * 0.3,
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Color(0xFFB08D57), thickness: 1.5),
            ),

            const SizedBox(height: 10),

            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: "Bienvenue sur ",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                  const TextSpan(
                    text: "Sen",
                    style: TextStyle(
                      fontSize: 23,
                      color: Color.fromARGB(255, 196, 165, 55),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text: "DeukouWaay",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              "Créer un compte pour commencer",
              style: TextStyle(fontSize: 15),
            ),

            //le formulaire
            const SizedBox(height: 35),
            Container(
              padding: EdgeInsets.only(left: 25),
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 170, 170, 167),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Entrez votre adresse mail",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
            Container(
              padding: EdgeInsets.only(left: 25),
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 170, 170, 167),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Entrez votre mot de passe",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),

            const SizedBox(height: 25),
            Container(
              padding: EdgeInsets.only(left: 25),
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 170, 170, 167),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Confirmez mot de passe",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),

            //boutton se connecter
            const SizedBox(height: 50),
            Container(
              height: 40,
              width: 250,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 160, 133, 13),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  "Se connecter",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  "Se connecter avec",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  Image.asset("assets/google.png", width: 30),
                  const SizedBox(width: 40),
                  Image.asset("assets/facebook.png", width: 30),
                  const SizedBox(width: 40),
                  Image.asset("assets/apple.png", width: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
