import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final String title;
  final bool backPage;
  final Widget menuWidget;
  const NavBar({
    Key? key,
    required this.title,
    this.backPage = false,
    required this.menuWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    return Container(
      // color: Colors.amber.withOpacity(0.5),
      padding: EdgeInsets.only(top: deviceData.padding.top, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          backPage ? IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context)) : Container(),
          menuWidget
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