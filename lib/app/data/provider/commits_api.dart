import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:github_home_test/app/data/models/commits_model.dart';
import 'package:github_home_test/app/data/network/endpoints.dart';

class CommitsApi {
  final Dio _dio = Get.find<Dio>();

  Future<Map<String, dynamic>> getApi() async {
    try {
      final Response<dynamic> response = await _dio.get(
        Endpoints.commits,
      );
      if (response.statusCode == 200) {
        return <String, dynamic>{
          'message': 'Lista de commits cargada correctamente',
          'data': commitsFromJson(json.encode(response.data as List<dynamic>)),
          'success': true,
        }; 
      }
      return <String, dynamic>{
        'message': 'Error al cargar la lista de commits',
        'data': <Commits>[],
        'success': false,
      };
    } on DioError catch (e) { 
      const String checkInternetMessage =
          'Revise su conexión a Internet y vuelva a intentarlo.';
      return <String, dynamic>{
        'message': e.type.name == 'other'
            ? checkInternetMessage
            : e.type.name == 'connectTimeout' 
                ? 'Se acabo el tiempo de espera. $checkInternetMessage'
                : e.message,
        'data': <Commits>[],
        'success': false
      };
    }
  }
}
