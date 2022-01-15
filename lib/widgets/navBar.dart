import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final String title;
  const NavBar({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 140,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {}),
        ],),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(title,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),)
      ],),
    );
  }
}