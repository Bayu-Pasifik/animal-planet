import 'dart:convert';

import 'package:animal_planet/app/data/models/animals.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var url = dotenv.env['BASE_URL_API']!;
  List<AnimalsModel> listmamalia = [];
  List<AnimalsModel> listReptile = [];
  List<AnimalsModel> listPices = [];
  List<AnimalsModel> listAves = [];
  List<AnimalsModel> listInsect = [];

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

  Future<List<AnimalsModel>> getPices() async {
    try {
      Uri uri = Uri.parse("$url?klasifikasi=Pices");
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var tempdata = json.decode(response.body)['data'];
        var data = tempdata.map((e) => AnimalsModel.fromJson(e));
        listPices = List<AnimalsModel>.from(data);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return listPices;
  }

  Future<List<AnimalsModel>> getAves() async {
    try {
      Uri uri = Uri.parse("$url?klasifikasi=Aves");
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var tempdata = json.decode(response.body)['data'];
        var data = tempdata.map((e) => AnimalsModel.fromJson(e));
        listAves = List<AnimalsModel>.from(data);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return listAves;
  }

  Future<List<AnimalsModel>> getInsect() async {
    try {
      Uri uri = Uri.parse("$url?klasifikasi=Serangga");
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var tempdata = json.decode(response.body)['data'];
        var data = tempdata.map((e) => AnimalsModel.fromJson(e));
        listInsect = List<AnimalsModel>.from(data);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return listInsect;
  }

  @override
  void onInit() async {
    // await getAllMaps();
    super.onInit();
  }
}
