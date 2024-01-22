import 'package:animal_planet/app/constant/utils.dart';
import 'package:animal_planet/app/data/models/animals.dart';
import 'package:animal_planet/app/data/widgets/tabalbum.dart';
import 'package:animal_planet/app/data/widgets/tabdeskripsi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/detail_content_controller.dart';

class DetailContentView extends GetView<DetailContentController> {
  const DetailContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimalsModel animal = Get.arguments['animal'];
    final String image = Get.arguments['images'];
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [greenColor, greenGradient],
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter))),
          DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: greenGradient,
                    expandedHeight: 250,
                    elevation: 0,
                    stretch: true,
                    pinned: true,
                    centerTitle: true,
                    title: Text(
                      '${animal.namaHewan}',
                      style: const TextStyle(
                          fontFamily: "nunitoSans",
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    bottom: TabBar(
                      labelColor: Colors.black,
                      indicatorColor: tabColor,
                      // indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 5.w,
                      tabs: const [
                        Tab(text: "Keterangan"),
                        Tab(text: "Album"),
                      ],
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  // Widget untuk tab Keterangan
                  buildDescriptionTab(animal),

                  // Widget untuk tab Album
                  buildAlbumTab(animal),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
