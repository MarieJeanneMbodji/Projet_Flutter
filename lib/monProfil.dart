import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MonProfil extends StatelessWidget {
  const MonProfil({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon Profil"),
        backgroundColor: const Color.fromARGB(255, 196, 165, 55),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: data['photo'] != null && data['photo'] != ''
                      ? NetworkImage(data['photo'])
                      : const AssetImage("assets/moi.jpg") as ImageProvider,
                ),

                const SizedBox(height: 12),

                Text(
                  data['nom'] ?? "Nom non renseigné",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),

                Text(data['email'] ?? "Email non renseigné"),
                const SizedBox(height: 5),

                Text(data['telephone'] ?? "Téléphone non renseigné"),
              ],
            ),
          );
        },
      ),
    );
  }
}
