import 'package:flutter/material.dart';
import 'maisons_page.dart';
import 'main.dart'; // page connexion

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 235, 235),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// ================= PROFIL / AVATAR =================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 255, 192, 1),
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "N'Tji SANGARE",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  /// AVATAR CLIQUABLE → PAGE CONNEXION
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginPage(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(
                        "https://scontent-lis1-1.xx.fbcdn.net/v/t1.6435-9/185721359_3547878065438214_5248153626717312444_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeFA56F04iSG1DgRlwaM8E7C7xZ78Wuuc1bvFnvxa65zVlnRjX_Oa7tqBRmwhJSiyPF4e8n8qeqUbgRvXymyFxRL&_nc_ohc=sgEUooMsq2kQ7kNvwFOHTAV&_nc_oc=AdnImJIqUYrrb7QSqLoC4NPMhIPSfrzoOXzjVUaLj_vTJIUZZCQ7sy6t2sVJfbryh38&_nc_zt=23&_nc_ht=scontent-lis1-1.xx&_nc_gid=ZM-hkszjez7WR18lY0RCIg&oh=00_Aftffcm5ajcRuY3tvzrjM5ROXk-RbGNlQP2HGTi0xCucMQ&oe=69A90CA0",
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// TEXTE ACCUEIL
              const Text(
                "Nous trouverons la maison qu'il vous faut, dans la région de votre choix",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  height: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              /// ================= LISTE DES RÉGIONS =================
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
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Saintlouis_ile_pecheur.jpg/1024px-Saintlouis_ile_pecheur.jpg",
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

  /// ================= WIDGET CARTE RÉGION =================
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
          MaterialPageRoute(
            builder: (_) => MaisonsPage(ville: ville),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: HouseCard(
          imageUrl: imageUrl,
          title: ville.toUpperCase(),
          address: "SENLOGEMENT",
          price: "Voir les maisons",
          tags: tags,
        ),
      ),
    );
  }
}

/// ================= WIDGET CARTE HOUSE =================
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
        color: const Color(0xFFFFFfCA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE
          ClipRRect(
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(20)),
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
                    const Icon(Icons.location_on,
                        color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(address),
                  ],
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    const Icon(Icons.house,
                        color: Colors.amber, size: 16),
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
                            color: Colors.white, fontSize: 12),
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
