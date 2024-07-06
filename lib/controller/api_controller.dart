import 'dart:convert';

import 'package:flutter/material.dart';

import '../helper/api_services.dart';
import '../model/model.dart';

class HomeProvider extends ChangeNotifier {
  List<DataModel> mainModal = [];
  bool isLoading = true;

  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();
    String? json = await ApiService().apiCalling();
    if (json != null) {
      List<dynamic> jsonData = jsonDecode(json);
      mainModal = jsonData.map((item) => DataModel.fromJson(item)).toList();
    }
    isLoading = false;
    notifyListeners();
  }

  HomeProvider() {
    fetchData();
  }
}
