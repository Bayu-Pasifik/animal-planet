import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_content_controller.dart';

class DetailContentView extends GetView<DetailContentController> {
  const DetailContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailContentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailContentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
