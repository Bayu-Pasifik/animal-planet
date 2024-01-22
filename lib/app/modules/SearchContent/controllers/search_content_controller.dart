import 'package:animal_planet/app/data/models/animals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchContentController extends GetxController {
  List<AnimalsModel> listAnimal = [];
  List<AnimalsModel> listSearch = [];
  var url = dotenv.env['BASE_URL_API']!;
  late TextEditingController searchController;
  var isSearch = false.obs;
  var notFound = "";
  Future<List<AnimalsModel>> searchAnimal(String keyword) async {
    try {
      Uri uri = Uri.parse(url);
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var tempdata = json.decode(response.body)['data'];
        var data = tempdata.map((e) => AnimalsModel.fromJson(e));
        listAnimal = List<AnimalsModel>.from(data);
        var filterdList = listAnimal
            .where((element) =>
                element.namaHewan != null &&
                element.namaHewan!
                    .toLowerCase()
                    .contains(keyword.toLowerCase()))
            .toList();
        if (filterdList.isEmpty) {
          notFound = "Hewan tidak ditemukan";
          listSearch.clear();
        }
        print("filterdList:$filterdList");
        listSearch.addAll(filterdList);
        update();
        return listSearch;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return [];
    }
    return [];
  }

  void setIsSearching(bool value) {
    isSearch.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchController.clear();
    super.dispose();
  }
}
