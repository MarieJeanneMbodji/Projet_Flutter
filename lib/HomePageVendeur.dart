import 'package:flutter/material.dart';
import 'maisonsPage.dart';
import 'favorisPage.dart';
import 'ajoutLogement.dart';
import 'mesLogement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'monProfil.dart';

class HomePageVendeur extends StatelessWidget {
  const HomePageVendeur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: buildHeader(context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Trouvez la maison qu'il vous faut, dans la région de votre choix !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [
                    buildRegionCard(
                      context,
                      ville: "Dakar",
                      imageUrl:
                          "https://discover-senegal.com/wp-content/uploads/2019/05/Monument_de_la_Renaissance_africaine2-2.jpg",
                      tags: ["Capitale", "Belle ville", "Moderne"],
                    ),

                    buildRegionCard(
                      context,
                      ville: "Thies",
                      imageUrl:
                          "https://laviesenegalaise.com/wp-content/uploads/2025/01/Cite-Lamy-de-Thies-quartier-le-plus-propre-au-Senegal-1.jpg",
                      tags: ["1ère région", "Calme", "Accessible"],
                    ),

                    buildRegionCard(
                      context,
                      ville: "Saint-Louis",
                      imageUrl:
                          "https://upload.wikimedia.org/wikipedia/commons/5/55/Saintlouis_pont_Faidherbe.jpg",
                      tags: ["Historique", "Fleuve", "Tourisme"],
                    ),

                    buildRegionCard(
                      context,
                      ville: "Kaolack",
                      imageUrl:
                          "https://www.au-senegal.com/IMG/jpg/_ancienne_gouvernance_de_kaolack.jpg",
                      tags: ["Centre", "Commerce", "Marché"],
                    ),

                    buildRegionCard(
                      context,
                      ville: "Ziguinchor",
                      imageUrl:
                          "https://tourisme.gouv.sn/wp-content/uploads/2025/02/031-DSC_7676-1170x694.jpg",
                      tags: ["Casamance", "Nature", "Paix"],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRegionCard(
    BuildContext context, {
    required String ville,
    required String imageUrl,
    required List<String> tags,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MaisonsPage(ville: ville)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: HouseCard(
          imageUrl: imageUrl,
          title: ville.toUpperCase(),
          address: "SenDeukouWaay",
          price: "Voir les maisons",
          tags: tags,
        ),
      ),
    );
  }
}

class HouseCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String address;
  final String price;
  final List<String> tags;

  const HouseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.address,
    required this.price,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 251, 251, 205),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(address),
                  ],
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    const Icon(Icons.house, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(price),
                  ],
                ),

                const SizedBox(height: 8),

                Wrap(
                  spacing: 8,
                  children: tags
                      .map(
                        (tag) => Chip(
                          backgroundColor: Colors.grey.shade800,
                          label: Text(
                            tag,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//header
PreferredSizeWidget buildHeader(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: Builder(
      builder: (context) => IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
    centerTitle: true,
    title: SizedBox(
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -12,
            child: Image.asset("assets/logo.png", height: 80),
          ),

          Positioned(
            top: 40,
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
        ],
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("assets/moi.jpg"),
            ),
            const SizedBox(height: 2),
            const Text(
              "Marie",
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 196, 165, 55),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/moi.jpg"),
              ),
              SizedBox(height: 10),
              Text(
                "Marie Jeanne Mbodji",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "mbodji.marie-jeanne@ugb.edu.sn",
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),

        buildDrawerItem(
          icon: Icons.add_home,
          text: "Ajouter un logement",
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Ajoutlogement()),
            );
          },
        ),

        buildDrawerItem(
          icon: Icons.add_home,
          text: "Mes logements",
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => Meslogement()),
            );
          },
        ),

        buildDrawerItem(
          icon: Icons.person,
          text: "Mon profil",
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MonProfil()),
            );
          },
        ),

        const Divider(),

        buildDrawerItem(
          icon: Icons.logout,
          text: "Déconnexion",
          onTap: () async {
            await FirebaseAuth.instance.signOut();
          },
        ),
      ],
    ),
  );
}

Widget buildDrawerItem({
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: Icon(icon, color: Colors.amber),
    title: Text(text),
    onTap: onTap,
  );
}
