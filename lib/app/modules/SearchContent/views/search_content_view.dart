import 'package:animal_planet/app/constant/utils.dart';
import 'package:animal_planet/app/data/models/animals.dart';
import 'package:animal_planet/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/search_content_controller.dart';

class SearchContentView extends GetView<SearchContentController> {
  const SearchContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: greenGradient,
        title: const Text(
          "Cari Hewan",
          style: TextStyle(
            fontFamily: "nunitoSans",
          ),
        ),
        centerTitle: true,
      ),
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
                  Form(
                    key: formKey,
                    child: TextFormField(
                      autofocus: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Masukkan Nama Hewan';
                        }
                        return null;
                      },
                      controller: controller.searchController,
                      onChanged: (value) => controller.update(),
                      autocorrect: true,
                      decoration: InputDecoration(
                        focusColor: tabColor,
                        hoverColor: tabColor,
                        fillColor: tabColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.r)),
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search),
                      ),
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
                              if (formKey.currentState!.validate()) {
                                controller.setIsSearching(true);
                                Future.delayed(
                                    const Duration(milliseconds: 500),
                                    () async {
                                  await controller.searchAnimal(
                                      controller.searchController.text);
                                  controller.setIsSearching(false);
                                });
                              }
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
                                return (controller.emptyText == "")
                                    ? controller.listSearch.isNotEmpty
                                        ? GridView.builder(
                                            padding: EdgeInsets.all(8.r),
                                            itemCount:
                                                controller.listSearch.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                                    maxCrossAxisExtent: 200,
                                                    childAspectRatio: 1 / 1.6,
                                                    crossAxisSpacing: 20,
                                                    mainAxisSpacing: 20),
                                            itemBuilder: (context, index) {
                                              AnimalsModel animal =
                                                  controller.listSearch[index];
                                              var images = animal
                                                  .imageLink![index]
                                                  .replaceAll(
                                                      "/view?usp=sharing", "")
                                                  .replaceAll(
                                                      "/view?usp=drive_link",
                                                      "")
                                                  .replaceAll("/d/", "")
                                                  .replaceAll(
                                                      "https://drive.google.com/",
                                                      "https://drive.google.com/uc?id=")
                                                  .replaceAll("file", "");
                                              // debugPrint(images);
                                              return GestureDetector(
                                                onTap: () => Get.toNamed(
                                                    Routes.DETAIL_CONTENT,
                                                    arguments: {
                                                      "animal": animal,
                                                      "images": images
                                                    }),
                                                child: SizedBox(
                                                  width: 220.w,
                                                  height: 220.h,
                                                  // color: Colors.red,
                                                  child: Stack(
                                                    children: [
                                                      SizedBox(
                                                        width: 220.w,
                                                        height: 220.h,
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: images,
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.r),
                                                              image:
                                                                  DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .fitHeight,
                                                              ),
                                                            ),
                                                          ),
                                                          placeholder: (context,
                                                                  url) =>
                                                              const Center(
                                                                  child:
                                                                      CircularProgressIndicator()),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Image.asset(
                                                                  "assets/images/Image_not_available.png"),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 20.h,
                                                        left: 0,
                                                        right: 0,
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Container(
                                                            width: 220.w,
                                                            height: 20.h,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                            child: Text(
                                                              "${animal.namaHewan}",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "nunitoSans",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      16.sp,
                                                                  color: Colors
                                                                      .white,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        : controller.notFound == ""
                                            ? Center(
                                                child: Text(
                                                  "Cari Hewan disini",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "nunitoSans",
                                                      color: lightTheme),
                                                ),
                                              )
                                            : Center(
                                                child: Text(
                                                  controller.notFound,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "nunitoSans",
                                                      color: lightTheme),
                                                ),
                                              )
                                    : Center(
                                        child: Text(
                                          controller.emptyText,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "nunitoSans",
                                              color: lightTheme),
                                        ),
                                      );
                              },
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 1 / 1.6,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemBuilder: (context, index) =>
                                  Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.white,
                                      direction: ShimmerDirection.ltr,
                                      child: Container(
                                        width: 220.w,
                                        height: 220.h,
                                        // color: Colors.amber,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(9.r)),
                                      )),
                              itemCount: 4,
                            ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
