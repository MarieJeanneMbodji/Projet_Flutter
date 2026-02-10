import 'package:flutter/material.dart';
import 'maison.dart';

class DescriptionPage extends StatelessWidget {
  final Maison maison;

  const DescriptionPage({super.key, required this.maison});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Description")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              maison.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${maison.price} FCFA",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text("Ville : ${maison.ville}",
                      style: const TextStyle(fontSize: 16)),
                  Text("Quartier : ${maison.quartier}",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),
                  const Text(
                    "Description du logement",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Maison moderne, bien située, avec toutes les commodités nécessaires.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
