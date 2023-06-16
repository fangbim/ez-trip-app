import 'package:ez_trip_app/models/planning.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Plan with ChangeNotifier {
  Map<String, Planning> _plans = {};

  Map<String, Planning> get plans => _plans;

  int get jumlah{
    return _plans.length;
  }

  void addPlan(String wisataId, String imageURL, String nama, String lokasi) {
      _plans.putIfAbsent(
          wisataId,
          () => Planning(
              id: wisataId, imageURL: imageURL, name: nama, lokasi: lokasi,));
    notifyListeners();
  }

  void deletePlan(){
    _plans.clear();
    notifyListeners();
  }
}