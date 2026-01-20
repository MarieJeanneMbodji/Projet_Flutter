import 'package:flutter/material.dart';
import 'package:page_accueil/HeaderDescription.dart';
import 'package:page_accueil/roundCornerPannel.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          children: [
            //zone header
            HeaderDescription(
              backgroundImagePath: "assets/maison8.png",
              height: height * 0.5,
            ),

            // zone Description
            Positioned(
              top: 450,
              left: 0,
              right: 0,
              bottom: 0,
              child: RoundCornerPannel(child: buildDescription()),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDescription() {
    final images = [
      "assets/chambre1.jpg",
      "assets/chambre2.jpg",
      "assets/salon1.jpg",
      "assets/salon2.jpg",
      "assets/sbain1.jpg",
      "assets/sbain2.jpg",
    ];
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          children: [
            Image.asset("assets/edit-info.png", width: 22),
            const SizedBox(width: 8),
            const Text(
              "Descriptions",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(220, 181, 136, 2),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),
        const Text(
          "Ajkljhgjertyuiimllkjhgfdfjkloiuytertyuiopoiuytrezqsdf,nbvcxwqsdfghjkl...",
          style: TextStyle(fontSize: 15),
        ),

        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Prix: ",
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(220, 181, 136, 2),
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: "2.000.000FCFA",
                style: TextStyle(
                  fontSize: 25,
                  color: const Color.fromARGB(209, 27, 27, 27),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Color(0xFFB08D57)),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(images[index], fit: BoxFit.cover),
            );
          },
        ),

        const Divider(color: Color(0xFFB08D57)),
        buildContact(),
        const SizedBox(height: 10),
        boutonAcheter(),
      ],
    );
  }

  Widget buildContact() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(142, 214, 209, 166),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Contact du propriétaire :",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 122, 90, 40),
            ),
          ),

          const SizedBox(height: 5),

          Row(
            children: [
              // photo du propriétaire
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/moi.jpg",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 5),

              // contacts
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Marie Jeanne Mbodji",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.email, size: 16),
                      SizedBox(width: 6),
                      Text("mbodji.marie-jeanne@ugb.edu.sn"),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 16),
                      SizedBox(width: 6),
                      Text("+221 77 969 88 65"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget boutonAcheter() {
    return SizedBox(
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(220, 181, 136, 2),
          foregroundColor: Colors.white,
        ),
        label: Text(
          "Acheter",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
