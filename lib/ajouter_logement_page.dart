import 'package:flutter/material.dart';

class AjouterLogementPage extends StatelessWidget {
  const AjouterLogementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ajouter un Logement")),
      body: const Center(
        child: Text(
          "Formulaire d'ajout de logement",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
