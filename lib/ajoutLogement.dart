import 'package:flutter/material.dart';
import 'package:page_accueil/main.dart';

class Ajoutlogement extends StatefulWidget {
  const Ajoutlogement({super.key});

  @override
  State<Ajoutlogement> createState() => _AjoutlogementState();
}

class _AjoutlogementState extends State<Ajoutlogement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 254, 246, 217),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/logo.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -35),
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
                  Row(
                    children: [
                      Transform.translate(
                        offset: Offset(15, -20),
                        child: IconButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(220, 181, 136, 2),
                            foregroundColor: Colors.white,
                          ),
                          icon: const Icon(Icons.add),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(20, -20),
                        child: Text(
                          "Ajouter un logement",
                          style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(220, 181, 136, 2),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xFFB08D57)),
                  // const SizedBox(height: 5),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/information.png",
                                  width: 20,
                                ),
                              ),
                            ),
                            Text(
                              "informations générales:",
                              style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.only(
                                left: 25,
                              ), //marge intérieure
                              height: 35,
                              margin: EdgeInsets.symmetric(
                                horizontal: 40,
                              ), //marge extérieure
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(232, 168, 168, 168),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Région",
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  suffixIcon: Image.asset(
                                    "assets/down-arrow.png",
                                    width: 6,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.only(
                                left: 25,
                              ), //marge intérieure
                              height: 35,
                              margin: EdgeInsets.symmetric(
                                horizontal: 40,
                              ), //marge extérieure
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(232, 168, 168, 168),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Ville",
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  suffixIcon: Image.asset(
                                    "assets/down-arrow.png",
                                    width: 6,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.only(
                                left: 25,
                              ), //marge intérieure
                              height: 35,
                              margin: EdgeInsets.symmetric(
                                horizontal: 40,
                              ), //marge extérieure
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(232, 168, 168, 168),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "quartier",
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  suffixIcon: Image.asset(
                                    "assets/down-arrow.png",
                                    width: 6,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.only(
                                left: 25,
                              ), //marge intérieure
                              height: 35,
                              margin: EdgeInsets.symmetric(
                                horizontal: 40,
                              ), //marge extérieure
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(232, 168, 168, 168),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Type de logement",
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  suffixIcon: Image.asset(
                                    "assets/down-arrow.png",
                                    width: 6,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Container(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/file.png",
                                      width: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Détails du logement:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 20),
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          232,
                                          168,
                                          168,
                                          168,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "Nombre de chambres",
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 10,
                                  ), // espace entre les deux

                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 70),
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          232,
                                          168,
                                          168,
                                          168,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "Prix",
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 20),
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          232,
                                          168,
                                          168,
                                          168,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "Nombre de toilettes",
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 10,
                                  ), // espace entre les deux

                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 20),
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          232,
                                          168,
                                          168,
                                          168,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "Superficie(m2)",
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.only(
                                left: 25,
                              ), //marge intérieure
                              height: 80,
                              margin: EdgeInsets.symmetric(
                                horizontal: 40,
                              ), //marge extérieure
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(232, 168, 168, 168),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Description",
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Container(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/camera.png",
                                      width: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Photos du logement",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.only(
                                left: 25,
                                right: 25,
                              ), //marge intérieure
                              height: 35,
                              margin: EdgeInsets.symmetric(
                                horizontal: 40,
                              ), //marge extérieure
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(232, 168, 168, 168),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Ajouter des images",
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  suffixIcon: Image.asset(
                                    "assets/add-photo.png",
                                    width: 6,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Container(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/phone-call.png",
                                      width: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Coordonnées du propriétaire",
                                  style: TextStyle(
                                    fontSize: 20,
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

                  const SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ), //marge intérieure
                    height: 26,
                    margin: EdgeInsets.symmetric(
                      horizontal: 40,
                    ), //marge extérieure
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(232, 168, 168, 168),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Téléphone/Whatshapp",
                        labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: Image.asset(
                          "assets/telephone-handle-silhouette.png",
                          width: 6,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ), //marge intérieure
                    height: 25,
                    margin: EdgeInsets.symmetric(
                      horizontal: 40,
                    ), //marge extérieure
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(232, 168, 168, 168),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: Image.asset("assets/mail.png", width: 6),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  SizedBox(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.check_box_rounded),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(220, 181, 136, 2),
                        foregroundColor: Colors.white,
                      ),
                      label: Text(
                        "Enregistrer",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
