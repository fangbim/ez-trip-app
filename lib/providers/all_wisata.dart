import 'dart:convert';

import 'package:ez_trip_app/models/wisata.dart';
import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;

import '../services/wisata_service.dart';

class AllWisata with ChangeNotifier {

  final _service = WisataService();
  bool isLoading = false;
  List<Wisata> _allwisata = [];

  List<Wisata> get allwisata {
    return _allwisata;
  }

  getData() async {

    isLoading = true;
    notifyListeners();
    
    _allwisata = await _service.getAll();

    isLoading = false;
    notifyListeners();
    
  }

  Wisata? findById(wisataId) {
    return _allwisata.firstWhereOrNull((wistId) => wistId.id == wisataId);
  }

}
