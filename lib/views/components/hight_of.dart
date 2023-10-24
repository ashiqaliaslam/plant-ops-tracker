import 'package:flutter/material.dart';

class HightOf extends StatelessWidget {
  final double height;
  const HightOf([
    this.height = 15,
    Key? key,
  ]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
