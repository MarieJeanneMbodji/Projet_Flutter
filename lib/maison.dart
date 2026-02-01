import 'package:flutter/material.dart';

class Maison {
  final String imageUrl;
  final int price;
  final String ville;
  final String quartier;
  final String description;

  bool isFavorite;

  Maison({
    required this.imageUrl,
    required this.price,
    required this.ville,
    required this.quartier,
    required this.description,
    this.isFavorite = false,
  });
}
