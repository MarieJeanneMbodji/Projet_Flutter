import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:page_accueil/description.dart';
import 'package:page_accueil/ajoutLogement.dart';
=======
import 'acceuil.dart'; // Page d’accueil (HomePage)
>>>>>>> ntjisang

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
<<<<<<< HEAD
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            buildBackgroundImage(),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //le logo et nom de l'appli
                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: Image.asset(
                      "assets/logo.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -40),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Sen",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 196, 165, 55),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: "DeukouWaay",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //champ texte pour description de l'appli
                  const SizedBox(height: 200),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),

                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Avec ",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          TextSpan(
                            text: "Sen",
                            style: TextStyle(
                              fontSize: 30,
                              color: const Color.fromARGB(255, 196, 165, 55),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: "DeukouWaay ",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          TextSpan(
                            text: "trouver votre chez-vous en un clic !!!",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  //boutton login
                  const SizedBox(height: 100),
                  Container(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Ajoutlogement(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          179,
                          169,
                          87,
                        ),
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  //boutton texte singn in
                  const SizedBox(height: 20),
                  Container(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 179, 169, 87),
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
=======
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
                    color: Color(0xFFFFFfCA),
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
                              "SenLogement",
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
                                ), // légère ombre pour effet flottant
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
                            )!.withOpacity(0.7), // fond semi-transparent
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
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: "PassWord",
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: Icon(Icons.visibility_off_outlined),
                            ),
                          ),
                        ),

                        const SizedBox(height: 60),

                        GestureDetector(
                          onTap: () {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Veuillez remplir tous les champs.",

                                  ),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFB59F2C),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        const Text(
                          "Register",
                          style: TextStyle(
                            color: Color.fromARGB(255, 181, 156, 32),
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
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
>>>>>>> ntjisang
      ),
    );
  }
}
