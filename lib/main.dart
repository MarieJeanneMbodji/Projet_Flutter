import 'package:flutter/material.dart';
import 'package:page_accueil/description.dart';
import 'package:page_accueil/ajoutLogement.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Page Accueil",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            builder: (context) => Description(),
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
      ),
    );
  }
}

buildBackgroundImage() => Container(
  width: double.infinity,
  height: double.infinity,
  decoration: BoxDecoration(
    image: DecorationImage(
      colorFilter: ColorFilter.mode(
        const Color.fromARGB(99, 12, 12, 12),
        BlendMode.darken,
      ),
      fit: BoxFit.cover,
      image: AssetImage("assets/pacceuil.png"),
    ),
  ),
);
