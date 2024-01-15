import 'dart:convert';

import 'package:animal_planet/app/data/models/animals.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var url = dotenv.env['BASE_URL_API']!;
  List<AnimalsModel> listmamalia = [];
  List<AnimalsModel> listReptile = [];

  Future<List<AnimalsModel>> getMamalia() async {
    try {
      Uri uri = Uri.parse("$url?klasifikasi=Mamalia");
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var tempdata = json.decode(response.body)['data'];
        var data = tempdata.map((e) => AnimalsModel.fromJson(e));
        listmamalia = List<AnimalsModel>.from(data);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return listmamalia;
  }
  Future<List<AnimalsModel>> getReptile() async {
    try {
      Uri uri = Uri.parse("$url?klasifikasi=Reptilia");
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var tempdata = json.decode(response.body)['data'];
        var data = tempdata.map((e) => AnimalsModel.fromJson(e));
        listReptile = List<AnimalsModel>.from(data);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return listReptile;
  }

  @override
  void onInit() async {
    // await getAllMaps();
    super.onInit();
  }
}
