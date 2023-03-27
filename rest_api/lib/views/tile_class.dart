import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final int index;
  final double extent;

  Tile({required this.index, required this.extent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      color: Colors.red,
      // child: Center(
      //   child: Text(
      //     '$index',
      //     style: const TextStyle(color: Colors.white),
      //   ),
      // ),
    );
  }
}
