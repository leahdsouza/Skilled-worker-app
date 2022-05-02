import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Product {
  final int id;
  final String title, description,name;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.name,
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    name: 'John Doe',
    id: 1,
    images: [
      "assets/images/carpenter1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "CARPENTER",
    price: 150,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    name: 'John Doe',
    id: 2,
    images: [
      "assets/images/painter1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "PAINTER",
    price: 300,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    name: 'John Doe',
    id: 3,
    images: [
      "assets/images/electrician1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "ELECTRICIAN",
    price: 200,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    name: 'John Doe',
    id: 4,
    images: [
      "assets/images/plumber1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "PLUMBER",
    price: 100,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    name: 'John Doe',
    id: 5,
    images: [
      "assets/images/cleaner1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "CLEANING",
    price: 100,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    name: 'John Doe',
    id: 6,
    images: [
      "assets/images/maid1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "MAID",
    price: 100,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    name: 'John Doe',
    id: 7,
    images: [
      "assets/images/driver1.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "DRIVER",
    price: 100,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Service";

