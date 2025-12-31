import 'package:flutter/material.dart';

//Cette classe permet de créer un Container avec des coins arrondies.
//Il met à l’intérieur le Widget transféré via la propriété child.

class RoundCornerPannel extends StatelessWidget {
  final Widget? child;
  final Color? color;
  const RoundCornerPannel({super.key, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(244, 252, 238, 188),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: child ?? Center(), //on peut avoir un contenu vide
    );
  }
}
