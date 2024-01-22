import 'package:animal_planet/app/constant/utils.dart';
import 'package:animal_planet/app/data/models/animals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/search_content_controller.dart';

class SearchContentView extends GetView<SearchContentController> {
  const SearchContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [greenColor, greenGradient],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: controller.searchController,
                    onChanged: (value) => controller.update(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(tabColor),
                      ),
                      onPressed: controller.isSearch.isFalse
                          ? () {
                              controller.setIsSearching(true);
                              Future.delayed(const Duration(seconds: 2),
                                  () async {
                                await controller.searchAnimal(
                                    controller.searchController.text);
                                controller.setIsSearching(false);
                              });
                            }
                          : () {},
                      child: const Text(
                        "Cari",
                        style: TextStyle(
                          fontFamily: "nunitoSans",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Obx(() => Expanded(
                        child: controller.isSearch.isFalse
                            ? GetBuilder<SearchContentController>(
                                builder: (c) {
                                  return controller.listSearch.isNotEmpty
                                      ? ListView.builder(
                                          itemBuilder: (context, index) {
                                            AnimalsModel animal =
                                                c.listSearch[index];
                                            return ListTile(
                                              title:
                                                  Text("${animal.namaHewan}"),
                                            );
                                          },
                                          itemCount:
                                              controller.listSearch.length,
                                        )
                                      : controller.notFound == ""
                                          ? Center(
                                              child: Text(
                                                "Cari Hewan disini",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "nunitoSans",
                                                    color: lightTheme),
                                              ),
                                            )
                                          : Center(
                                              child: Text(
                                                controller.notFound,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "nunitoSans",
                                                    color: lightTheme),
                                              ),
                                            );
                                },
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
