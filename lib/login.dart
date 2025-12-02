import 'package:flutter/material.dart';
import 'package:page_accueil/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildBackgroundImage(),
          SingleChildScrollView(),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Sen",
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 253, 238, 123),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Logement",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Icon
                Icon(
                  Icons.account_box_rounded,
                  size: 100,
                  color: const Color.fromARGB(255, 196, 165, 55),
                ),

                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),

                //champs Email
                const SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  padding: EdgeInsets.only(left: 25),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 175, 166, 166),
                    border: Border.all(
                      color: const Color.fromARGB(255, 209, 175, 53),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      icon: Icon(Icons.email_rounded),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  padding: EdgeInsets.only(left: 25),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 175, 166, 166),
                    border: Border.all(
                      color: const Color.fromARGB(255, 209, 175, 53),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "PassWord",
                      icon: Icon(Icons.lock_clock_outlined),
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                //botton se connecter
                const SizedBox(height: 70),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 209, 175, 53),
                      foregroundColor: Colors.white,
                    ),
                    child: Text("Register", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),

          //boutton annuler
          Positioned(
            bottom: 80,
            left: 40,
            right: 40,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 209, 175, 53),
              ),
              child: Text("Cancel", style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

  buildBackgroundImage() => Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        colorFilter: ColorFilter.mode(
          const Color.fromARGB(100, 0, 0, 0),
          BlendMode.darken,
        ),
        fit: BoxFit.cover,
        image: AssetImage("assets/pacceuil.png"),
      ),
    ),
  );
}
