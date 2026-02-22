import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'HeaderInscription.dart';
import 'HomePageVendeur.dart';
import 'HomePageAcheteur.dart';

class PageInscription extends StatefulWidget {
  const PageInscription({super.key});

  @override
  State<PageInscription> createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  String role = "buyer"; // rôle par défaut
  bool _isLoading = false;

  Future<void> _registerUser() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez remplir tous les champs")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Les mots de passe ne correspondent pas")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(cred.user!.uid)
          .set({
            "email": email,
            "role": role,
            "createdAt": FieldValue.serverTimestamp(),
          });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Erreur d'inscription")),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Headerinscription(
                backgroundImagePath: "assets/house.png",
                height: height * 0.3,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: Color(0xFFB08D57), thickness: 1.5),
              ),
              const SizedBox(height: 10),
              const Text(
                "Créer un compte pour commencer",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 35),

              // Email
              Container(
                padding: const EdgeInsets.only(left: 25),
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 170, 170, 167),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: "Entrez votre adresse mail",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Mot de passe
              Container(
                padding: const EdgeInsets.only(left: 25),
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 170, 170, 167),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _passwordController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Entrez votre mot de passe",
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Confirmer mot de passe
              Container(
                padding: const EdgeInsets.only(left: 25),
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 170, 170, 167),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: obscureConfirmPassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Confirmez mot de passe",
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureConfirmPassword = !obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // Bouton s'inscrire
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 160, 133, 13),
                    foregroundColor: Colors.white,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "S'inscrire",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 30),

              // Dropdown rôle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: DropdownButtonFormField(
                  value: role,
                  items: const [
                    DropdownMenuItem(value: "buyer", child: Text("Acheteur")),
                    DropdownMenuItem(value: "seller", child: Text("Vendeur")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      role = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: "Type d'utilisateur",
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
