import 'dart:convert';

import 'package:ez_trip_app/models/wisata.dart';
import 'package:http/http.dart' as http;

class WisataService {
  Future getAll() async {
    // const url = 'http://http://10.214.102.209:8000/wisata';
    const url = 'http://10.1.21.142:8000/wisata'; //ip uisi
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    try{
      if (response.statusCode == 200) {
      // print(response.body);
      Iterable it = jsonDecode(response.body);
      List<Wisata> wisata = it.map((e) => Wisata.fromJson(e)).toList();
      return wisata;
    }

    }catch(e){
      print(e.toString());
    }    // throw "Something went wrong";
    
  }
}
