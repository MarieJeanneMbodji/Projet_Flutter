import 'package:flutter/material.dart';
import 'package:page_accueil/pageInscription.dart';
import 'HomePageAcheteur.dart';
import 'HomePageVendeur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Veuillez remplir tous les champs."),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Afficher un loader pendant la connexion
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!mounted) return;

      Navigator.pop(context);
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      final role = doc['role'];

      if (!mounted) return;

      Navigator.pop(context);

      if (role == "seller") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePageVendeur()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePageAcheteur()),
        );
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      debugPrint("Firebase error code: ${e.code}");

      String message;

      switch (e.code) {
        case 'user-not-found':
        case 'invalid-email':
        case 'invalid-credential':
          message =
              "Aucun compte trouvé avec cet email. Veuillez vous inscrire.";
          break;

        case 'wrong-password':
          message = "Mot de passe incorrect. Veuillez réessayer.";
          break;

        case 'too-many-requests':
          message = "Trop de tentatives. Veuillez réessayer plus tard.";
          break;

        default:
          message = "Erreur: ${e.message}";
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.redAccent),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bank.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Column(
            children: [
              const SizedBox(height: 80),

              // Icon + Login
              Column(
                children: const [
                  Icon(
                    Icons.person,
                    size: 140,
                    color: Color.fromARGB(255, 214, 182, 20),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: const Color.fromARGB(255, 250, 250, 220),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Nom du service / logo
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
                              "SenDeukouWaay",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        // Email field
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                              255,
                              153,
                              149,
                              149,
                            )!.withOpacity(0.7), // fond semi-transparent
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(
                                  0,
                                  3,
                                ), // légère ombre pour effet flottant;
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: "Email",
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                              255,
                              125,
                              123,
                              123,
                            )!.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: passwordController,
                            obscureText: obscurePassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Mot de passe",
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obscurePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
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
                        const SizedBox(height: 60),

                        GestureDetector(
                          onTap: loginUser, // appel de la fonction loginUser
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFB59F2C),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Text(
                                "Se connecter",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageInscription(),
                              ),
                            );
                          },
                          child: Text(
                            "S'inscrire",
                            style: TextStyle(
                              color: Color.fromARGB(255, 181, 156, 32),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
