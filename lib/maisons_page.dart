import 'package:flutter/material.dart';
import 'maison.dart';
import 'favoris_page.dart';
import 'Acceuil.dart';
import 'ajouter_logement_page.dart';
import 'description_page.dart';

class MaisonsPage extends StatefulWidget {
  final String ville;

  const MaisonsPage({super.key, required this.ville});

  @override
  State<MaisonsPage> createState() => _MaisonsPageState();
}

class _MaisonsPageState extends State<MaisonsPage> {

  /* ================= CONTROLLERS ================= */
  final TextEditingController searchController = TextEditingController();
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  /* ================= DONNÉES ================= */
  late List<Maison> maisonsFiltrees;

  final List<Maison> maisons = [
    Maison(
        imageUrl: "assets/img/maison1.JPG",
        price: 5000000,
        ville: "Dakar",
        quartier: "Almadies"),
    Maison(
        imageUrl: "assets/img/maison2.JPG",
        price: 7000000,
        ville: "Dakar",
        quartier: "Keur Massar"),
    Maison(
        imageUrl: "assets/img/maison3.JPG",
        price: 6000000,
        ville: "Thies",
        quartier: "Grand Standing"),
    Maison(
        imageUrl: "assets/img/maison4.JPG",
        price: 10000000,
        ville: "Saint-Louis",
        quartier: "Hydrobase"),
  ];

  /* ================= INIT ================= */
  @override
  void initState() {
    super.initState();
    // On affiche seulement les maisons de la ville choisie
    maisonsFiltrees = maisons.where((m) => m.ville == widget.ville).toList();
  }

  /* ================= LOGIQUE ================= */

  // Appliquer la recherche + filtre prix
  void appliquerFiltres() {
    final query = searchController.text.toLowerCase();
    final minPrice = int.tryParse(minPriceController.text) ?? 0;
    final maxPrice = int.tryParse(maxPriceController.text) ?? 999999999;

    setState(() {
      maisonsFiltrees = maisons.where((m) {
        return m.ville == widget.ville &&
            m.quartier.toLowerCase().contains(query) &&
            m.price >= minPrice &&
            m.price <= maxPrice;
      }).toList();
    });
  }

  // Suggestions pour l'autocomplete
  List<String> getSuggestions() {
    return maisons
        .where((m) => m.ville == widget.ville)
        .map((m) => m.quartier)
        .toSet()
        .toList();
  }

  // Ouvrir la page favoris
  void ouvrirFavoris() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            FavorisPage(favoris: maisons.where((m) => m.isFavorite).toList()),
      ),
    );
  }

  // Bottom sheet des filtres
  void ouvrirFiltreModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: minPriceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Prix min"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: maxPriceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Prix max"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                appliquerFiltres();
                Navigator.pop(context);
              },
              child: const Text("Appliquer les filtres"),
            ),
          ],
        ),
      ),
    );
  }

  /* ================= UI ================= */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFfCA),

      /* -------- MENU GAUCHE -------- */
      drawer: buildDrawer(),

      /* -------- APP BAR -------- */
      appBar: buildAppBar(),

      /* -------- CONTENU -------- */
      body: Column(
        children: [
          buildSearchBar(),
          buildMaisonsGrid(),
        ],
      ),
    );
  }

  /* ================= WIDGETS ================= */

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFFFFfCA),
      centerTitle: true,
      title: Column(
        children: [
          Image.asset('assets/loge.png', height: 30),
          const SizedBox(height: 4),
          const Text("SenLogement",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite, color: Colors.red),
          onPressed: ouvrirFavoris,
        ),
      ],
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 242, 219, 7),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/loge.png', height: 50),
                const SizedBox(height: 10),
                const Text("SenLogement",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Accueil"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.house),
            title: const Text("Mes Logements"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Favoris"),
            onTap: () {
              Navigator.pop(context);
              ouvrirFavoris();
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_home),
            title: const Text("Ajouter un Logement"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const AjouterLogementPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Autocomplete<String>(
              optionsBuilder: (value) => getSuggestions().where(
                    (s) => s.toLowerCase().contains(value.text.toLowerCase()),
              ),
              onSelected: (value) {
                searchController.text = value;
                appliquerFiltres();
              },
              fieldViewBuilder: (context, controller, focusNode, _) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  onChanged: (_) => appliquerFiltres(),
                  decoration: InputDecoration(
                    hintText: "Quartier",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: ouvrirFiltreModal,
          ),
        ],
      ),
    );
  }

  Widget buildMaisonsGrid() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 12,
          mainAxisSpacing: 20,
        ),
        itemCount: maisonsFiltrees.length,
        itemBuilder: (context, index) {
          return buildMaisonCard(maisonsFiltrees[index]);
        },
      ),
    );
  }

  /// Carte maison (image + favoris + infos)
  Widget buildMaisonCard(Maison maison) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DescriptionPage(maison: maison),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  maison.imageUrl,
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    maison.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color:
                    maison.isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      maison.isFavorite = !maison.isFavorite;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text("${maison.price} FCFA",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text("${maison.quartier}, ${maison.ville}",
              style: TextStyle(color: Colors.grey.shade700)),
        ],
      ),
    );
  }
}
