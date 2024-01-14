import 'dart:convert';

import 'package:animal_planet/app/data/models/animals.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var url = dotenv.env['BASE_URL_API']!;
  List<AnimalsModel> listmamalia = [];
  Future<List<AnimalsModel>> getMamalia() async {
    try {
      Uri uri = Uri.parse("$url?klasifikasi=Mamalia");
      print(uri);
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var tempdata = json.decode(response.body)['data'];
        var data = tempdata.map((e) => AnimalsModel.fromJson(e));
        listmamalia = List<AnimalsModel>.from(data);
      }
    } catch (e) {
      // listMap = [];
      Get.snackbar("Error", e.toString());
    }
    return listmamalia;
  }

  @override
  void onInit() async {
    // await getAllMaps();
    super.onInit();
  }
}
