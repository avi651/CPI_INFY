import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../constants/host_constants.dart';
import '../models/iss_data_model.dart';
import 'package:http/http.dart' as http;

class CIPRepository {
  final url = kHostApi + kPath;
  Future<ISSDataModel> getISSDataModel() async {
    try {
      final response = await http.get(Uri.parse(url));
      final jsonMap = json.decode(response.body);
      return ISSDataModel.fromJson(jsonMap);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      throw Error();
    }
  }
}
