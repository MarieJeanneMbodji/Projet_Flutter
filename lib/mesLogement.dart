import 'package:flutter/material.dart';
import 'headerPages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Meslogement extends StatelessWidget {
  const Meslogement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header +bouton retour
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                Headerpages(height: 110),

                Positioned(
                  top: 70,
                  left: 10,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Image.asset("assets/left-arrow.png", width: 24),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Mes Logements",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(220, 181, 136, 2),
            ),
          ),

          const SizedBox(height: 10),

          // Liste Firebase
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('logements')
                  .where(
                    'ownerId',
                    isEqualTo: FirebaseAuth.instance.currentUser?.uid ?? '',
                  )
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("Aucun logement publié"));
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: docs.length,
                  itemBuilder: (context, i) {
                    final data = docs[i].data() as Map<String, dynamic>;

                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            data['images'][0],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          "${data['type']} - ${data['prix']} FCFA",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${data['ville']} - ${data['quartier']}",
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
