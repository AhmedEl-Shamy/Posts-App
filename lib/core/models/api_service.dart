import 'package:http/http.dart' as http;
import 'package:posts_app/core/models/exceptions.dart';

abstract class APIService {
  final String apiURL;
  APIService({required this.apiURL});

  Future<String> get({required String endPoint});
  Future<bool> post({
    required String endPoint,
    required Map<String, dynamic> body,
  });
  Future<bool> delete({
    required String endPoint,
    required dynamic data,
  });
  Future<bool> update({
    required String endPoint,
    required dynamic data,
    required Map<String, dynamic> body,
  });
}

class APIServiceImpl extends APIService {
  APIServiceImpl({required this.client})
      : super(apiURL: 'https://jsonplaceholder.typicode.com');

  final http.Client client;

  @override
  Future<bool> delete({required String endPoint, required dynamic data}) async {
    String id = data.toString();
    final http.Response response =
        await client.delete(Uri.parse('$apiURL/$endPoint/$id'));
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      return true;
    }
  }

  @override
  Future<String> get({required String endPoint}) async {
    final http.Response response =
        await client.get(Uri.parse('$apiURL/$endPoint'));
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      return response.body;
    }
  }

  @override
  Future<bool> post({
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    final http.Response response =
        await client.post(Uri.parse('$apiURL/$endPoint'), body: body);
    if (response.statusCode != 201) {
      throw ServerException();
    } else {
      return true;
    }
  }

  @override
  Future<bool> update({
    required String endPoint,
    required dynamic data,
    required Map<String, dynamic> body,
  }) async {
    final String id = data.toString();
    final http.Response response =
        await client.patch(Uri.parse('$apiURL/$endPoint/$id'), body: body);
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      return true;
    }
  }
}
