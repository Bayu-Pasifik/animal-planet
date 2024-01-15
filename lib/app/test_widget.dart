import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Image.network(
              "https://drive.google.com/uc?id=16WEYbylUlBBiFChVu7oe3taH3tgdiSP8")),
    );
  }
}
