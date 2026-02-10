import 'package:flutter/material.dart';
import 'acceuil.dart';
import 'maisons_page.dart';


class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8EC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage('assets/loge.png'),
                      width: 40,
                      height: 40,
                    ),

                    SizedBox(width: 5),
                    Text(
                      "SenLogement",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // 🔙 Bouton retour
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                const SizedBox(height: 10),

                // 🏠 Illustration
                Image.asset(
                  "assets/inscrip.PNG", // image maison
                  height: 150,
                ),

                const SizedBox(height: 10),

                // 🏷️ Titre
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Bienvenue à ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: "SenDeukouWaay",
                        style: TextStyle(
                          color: Colors.amber.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Créez un compte pour commencer",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 25),

                // 📧 Email
                buildInput(
                  hint: "Entrez votre adresse mail",
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 15),

                // 🔑 Mot de passe
                buildPasswordInput(
                  hint: "Entrer votre mot de passe",
                  isHidden: hidePassword,
                  onTap: () {
                    setState(() => hidePassword = !hidePassword);
                  },
                ),

                const SizedBox(height: 15),

                // 🔑 Confirmation mot de passe
                buildPasswordInput(
                  hint: "Confirmez le mot de passe",
                  isHidden: hideConfirmPassword,
                  onTap: () {
                    setState(() => hideConfirmPassword = !hideConfirmPassword);
                  },
                ),

                const SizedBox(height: 25),

                // 🔘 Bouton connexion
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigation vers HomePage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Se connecter",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),

                const SizedBox(height: 25),

                const Text(
                  "Se connecter avec",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 15),

                // 🌐 Réseaux sociaux
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialIcon("assets/google.png"),
                    const SizedBox(width: 20),
                    socialIcon("assets/facebook.png"),
                    const SizedBox(width: 20),
                    socialIcon("assets/apple.png"),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Champ texte simple
  Widget buildInput({required String hint, required IconData icon}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: const Color(0xFFE6DDB3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // 🔹 Champ mot de passe
  Widget buildPasswordInput({
    required String hint,
    required bool isHidden,
    required VoidCallback onTap,
  }) {
    return TextField(
      obscureText: isHidden,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFE6DDB3),
        suffixIcon: IconButton(
          icon: Icon(
            isHidden ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: onTap,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // 🔹 Icône sociale
  Widget socialIcon(String asset) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.white,
      child: Image.asset(asset, height: 22),
    );
  }
}
