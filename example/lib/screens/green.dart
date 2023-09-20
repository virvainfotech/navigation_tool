import 'package:flutter/material.dart';

class Green extends StatelessWidget {
  const Green({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF2A282D),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
