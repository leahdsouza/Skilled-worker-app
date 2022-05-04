import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Product {
  final int id;
  final String title, description,name,address;
  final List<String> images;
  final List<Color> colors;
  final double rating;
  final int price;
  final bool isFavourite, isPopular;

  Product({
    required this.address,
    required this.name,
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0,
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
    address: 'B/1 Rizvi Park S V Rd Nr Milan Subway Rd Santacruz , Mumbai,Mumbai,400054,India',

    name: 'Rohit Das',
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
    title: "Carpenter",
    price: 300,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    address: 'Phase 2 Shop No 9 Sector 8 Nerul Navi Mumbai, Mumbai,Mumbai,400706,India',

    name: 'Arvind Yadav',
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
    title: "Painter",
    price: 600,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    address: 'Shop No 79 Japani Bazar Ulhasnagar, Mumbai,Mumbai,421002,India',
    name: 'Barjraj Das',
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
    title: "Electrician",
    price: 250,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    address: '228 -a Neelkanth Marine Drive Kalbadevi, Mumbai,Mumbai,400002,India' ,
    name: 'Sunder ',
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
    title: "Plumber",
    price: 450,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    address: 'Shop No 220 Fashqua Shopping Centre Opp Super Bazar Stn Road Santacruz, Mumbai,Mumbai,400054,India',
    name: 'Rohit Patel',
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
    title: "Cleaning",
    price: 400,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    address: 'D-201 Ghatkopar Industrial Est. Off L.b.s Marg Ghatkopar , Mumbai,Mumbai,400086,India',
    name: 'Aman Gupta',
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
    title: "Maid",
    price: 250,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    address: 'G-1 251 Jawahar Ngr rd No.15 Goregaon , Mumbai,Mumbai,400062,India',
    name: 'Kausal Kumar',
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
    title: "Driver ",
    price: 450,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Service";

