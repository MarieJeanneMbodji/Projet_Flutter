import 'package:flutter/material.dart';
import 'package:page_accueil/headerPages.dart';
import 'main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Ajoutlogement extends StatefulWidget {
  const Ajoutlogement({super.key});

  @override
  State<Ajoutlogement> createState() => _AjoutlogementState();
}

class _AjoutlogementState extends State<Ajoutlogement> {
  String? regionSelectionnee;

  final List<String> regions = [
    "Dakar",
    "Thiès",
    "Louga",
    "Saint-Louis",
    "Matam",
    "Tambacounda",
    "Kédougou",
    "Kolda",
    "Sédhiou",
    "Ziguinchor",
    "Kaolack",
    "Diourbel",
    "Kaffrine",
    "Fatick",
  ];

  String? villeSelectionnee;
  final List<String> villes = [
    "Touba",
    "Pikine",
    "Guédiawaye",
    "Mbour",
    "Rufisque",
    "Mbacké",
    "Tiwawane",
    "Richard-Toll",
    "Bargny",
    "Joal-fadiouth",
    "Dahra",
    "Bignona",
    "Saint-Louis",
  ];

  String? quartierSelectione;
  final List<String> quartier = [
    "Parcelles Assainies",
    "Cité keur Guorr Gui",
    "Almadies",
    "Gualléle",
  ];

  String? TypeLogementSelectionnee;
  final List<String> logement = [
    "Appartement",
    "Maison",
    "Studio",
    "Chambre",
    "Villa",
  ];

  final ImagePicker _picker = ImagePicker();
  List<File> images = [];

  Future<void> ajouterImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        images.add(File(image.path));
      });
    }
  }

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
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: IconButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              220,
                              181,
                              136,
                              2,
                            ),
                            foregroundColor: Colors.white,
                          ),
                          icon: const Icon(Icons.add),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Text(
                        "Ajouter un logement",
                        style: TextStyle(
                          fontSize: 25,
                          color: const Color.fromARGB(220, 181, 136, 2),
                          fontStyle: FontStyle.italic,
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
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                height: 40,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    232,
                                    168,
                                    168,
                                    168,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: regionSelectionnee,
                                    hint: const Text(
                                      "Région",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    icon: Image.asset(
                                      "assets/down-arrow.png",
                                      width: 25,
                                    ),
                                    isExpanded: true,
                                    items: regions.map((String region) {
                                      return DropdownMenuItem<String>(
                                        value: region,
                                        child: Text(region),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        regionSelectionnee = value;
                                      });
                                    },
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
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                height: 40,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    232,
                                    168,
                                    168,
                                    168,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: villeSelectionnee,
                                    hint: const Text(
                                      "Ville",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    icon: Image.asset(
                                      "assets/down-arrow.png",
                                      width: 25,
                                    ),
                                    isExpanded: true,
                                    items: villes.map((String villes) {
                                      return DropdownMenuItem<String>(
                                        value: villes,
                                        child: Text(villes),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        villeSelectionnee = value;
                                      });
                                    },
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
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                height: 40,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    232,
                                    168,
                                    168,
                                    168,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: quartierSelectione,
                                    hint: const Text(
                                      "quartier",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    icon: Image.asset(
                                      "assets/down-arrow.png",
                                      width: 25,
                                    ),
                                    isExpanded: true,
                                    items: quartier.map((String quartier) {
                                      return DropdownMenuItem<String>(
                                        value: quartier,
                                        child: Text(quartier),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        quartierSelectione = value;
                                      });
                                    },
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
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                ),
                                height: 40,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    232,
                                    168,
                                    168,
                                    168,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: TypeLogementSelectionnee,
                                    hint: const Text(
                                      "Type de Logement",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    icon: Image.asset(
                                      "assets/down-arrow.png",
                                      width: 25,
                                    ),
                                    isExpanded: true,
                                    items: logement.map((String logement) {
                                      return DropdownMenuItem<String>(
                                        value: logement,
                                        child: Text(logement),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        TypeLogementSelectionnee = value;
                                      });
                                    },
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
                                  suffixIcon: IconButton(
                                    onPressed: ajouterImage,
                                    icon: Image.asset(
                                      "assets/add-photo.png",
                                      width: 30,
                                    ),
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

              // la flèche retour
              Positioned(
                top: 20,
                left: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset("assets/left-arrow.png", width: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
