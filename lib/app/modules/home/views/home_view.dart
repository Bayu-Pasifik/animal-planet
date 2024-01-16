import 'package:animal_planet/app/constant/utils.dart';
import 'package:animal_planet/app/data/widgets/tabcontainer.dart';
import 'package:animal_planet/app/data/widgets/tabcontent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightTheme,
        body: SafeArea(
          child: DefaultTabController(
            length: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  const Text(
                    "Selamat Datang... 👋",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Temukan Hewan Kesukaanmu disini",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 15.h),
                  const Text(
                    "Hewan mana yang ingin anda pelajari?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 320.w,
                      height: 70.h,
                      child: const TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TabBar(
                      physics: const BouncingScrollPhysics(),
                      tabAlignment: TabAlignment.center,
                      isScrollable: true,
                      indicator: BoxDecoration(
                          color: tabColor,
                          borderRadius: BorderRadius.circular(9.r)),
                      tabs: const [
                        TabContainer(
                          asset: "assets/images/lion.png",
                          name: "Mamalia",
                        ),
                        TabContainer(
                          asset: "assets/images/crocodile.png",
                          name: "Reptil",
                        ),
                        TabContainer(
                          asset: "assets/images/clown-fish.png",
                          name: "Ikan",
                        ),
                        TabContainer(
                          asset: "assets/images/bird.png",
                          name: "Burung",
                        ),
                        TabContainer(
                          asset: "assets/images/cricket.png",
                          name: "Serangga",
                        ),
                      ]),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: SizedBox(
                      width: Get.width,
                      height: MediaQuery.of(context).size.height,
                      // color: Colors.amber,
                      child: TabBarView(children: [
                        // Text("Mamalia"),
                        TabbarContent(futureFunction: controller.getMamalia(),detailTo: "mamalia"),
                        TabbarContent(futureFunction: controller.getReptile(),detailTo: "reptile",),
                        // Text("Reptil"),
                        Text("Ikan"),
                        Text("Burung"),
                        Text("Serangga"),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
