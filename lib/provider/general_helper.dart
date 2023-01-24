import 'package:flutter/material.dart';
import 'package:test/service/http_services.dart';

class GeneralHelper extends ChangeNotifier {
  List vehicles = [];
  Map<String, dynamic> vehicle = {};

  void getVehicles() async {
    final result = await HTTPServices.getData('https://swapi.dev/api/vehicles');
    vehicles = result['results'];
    notifyListeners();
  }


}
