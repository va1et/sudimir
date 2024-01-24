import 'dart:convert';
import 'dart:developer';

import 'package:agro_hack23/data/models/book_modal.dart';
import 'package:agro_hack23/data/models/excursion_modal.dart';
import 'package:agro_hack23/domain/entities/book.dart';
import 'package:dio/dio.dart';
import 'package:agro_hack23/common/errors/exceptions.dart';
import 'package:agro_hack23/data/datasources/user_local.dart';
import 'package:agro_hack23/data/models/user_modal.dart';

abstract class UserRemoteData {
  Future<String> auth(String login, String password);
  Future<UserModel> getProfileData(String accessToken);
  Future<List<UserModel>> getEmployees(
      int offset, int limit, String accessToken);
  Future<List<UserModel>> getUsers(int offset, int limit, String accessToken);
  Future<String> signupUser(String email, String firstName, String lastName,
      String phone, String middleName, String password);
  Future<List<BookModel>> getBookings(
    int offset,
    int limit,
    String accessToken,
  );
  Future<void> deleteBooking(String id, String accessToken);
  Future<void> deleteEmployee(String id, String accessToken);

  Future<void> deleteService(String id, String accessToken);

  Future<BookModel> sendBooking(
    Map<String, dynamic> data,
    String accessToken,
  );
  Future<void> addEmployee(
    Map<String, dynamic> data,
    String accessToken,
  );
  Future<ExcursionModel> sendService(
    Map<String, dynamic> data,
    String accessToken,
  );
  Future<List<ExcursionModel>> getServices(
    int offset,
    int limit,
    String accessToken,
  );
}

class UserRemoteDataImpl implements UserRemoteData {
  static const _apiUrl = 'http://217.18.62.200:8000';

  final Dio httpClient;

  UserRemoteDataImpl({required this.httpClient});

  @override
  Future<String> auth(String login, String password) async {
    final response = await httpClient.post('$_apiUrl/auth/signin', data: {
      "email": login,
      "password": password,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      // Parse the JSON string
      Map<String, dynamic> jsonMap = response.data;
      print(jsonMap['access_token']);
      return jsonMap['access_token'];
    } else {
      throw ServerException('Response status code is $response.statusCode');
    }
  }

  @override
  Future<UserModel> getProfileData(String accessToken) async {
    try {
      print('access');
      httpClient.options.headers = {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json'
      };
      final response = await httpClient.get("$_apiUrl/user/me");
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        print(data);
        return UserModel.fromJson(data);
      } else {
        throw ServerException('Response status code is ${response.statusCode}');
      }
    } catch (e) {
      print("ss");
      throw ServerException('Log in Again}');
    }
  }

  @override
  Future<String> signupUser(String email, String firstName, String lastName,
      String phone, String middleName, String password) async {
    final response = await httpClient.post("$_apiUrl/auth/signup", data: {
      "email": email,
      "first_ame": firstName,
      "last_name": lastName,
      "middle_ame": middleName,
      "phone": phone,
      "password": password,
      "role": 'admin',
    });
    if (response.statusCode == 201) {
      Map<String, dynamic> jsonMap = response.data;

      return jsonMap['access_token'];
    } else {
      throw ServerException('Response status code is ${response.statusCode}');
    }
  }

  @override
  Future<List<BookModel>> getBookings(
      int offset, int limit, String accessToken) async {
    final response = await httpClient
        .get('$_apiUrl/booking/all?limit=$limit&offset=$offset');

    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;

      return data["bookings"]
          .map<BookModel>((bookingItem) => BookModel.fromJson(bookingItem))
          .toList();
    } else {
      throw ServerException('Response status code is statusCode');
    }
  }

  @override
  Future<List<ExcursionModel>> getServices(
      int offset, int limit, String accessToken) async {
    final response = await httpClient
        .get('${_apiUrl}/service/all?limit=$limit&offset=$offset');
    print(response);
    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      // print("object");
      // myLohsjjjsjsngPrint(json.encode(data));
      return data["services"]
          .map<ExcursionModel>(
              (excursionItem) => ExcursionModel.fromJson(excursionItem))
          .toList();
    } else {
      throw ServerException('Response status code is statusCode');
    }
  }

  @override
  Future<BookModel> sendBooking(
      Map<String, dynamic> data, String accessToken) async {
    final response =
        await httpClient.post('${_apiUrl}/booking/new', data: data);
    print(response);
    if (response.statusCode == 201) {
      final data = response.data as Map<String, dynamic>;

      return BookModel.fromJson(data);
    } else {
      throw ServerException('Response status code is statusCode');
    }
  }

  @override
  Future<ExcursionModel> sendService(
      Map<String, dynamic> data, String accessToken) async {
    final response =
        await httpClient.post('${_apiUrl}/service/new', data: data);

    if (response.statusCode == 201) {
      final data = response.data as Map<String, dynamic>;

      return ExcursionModel.fromJson(data);
    } else {
      throw ServerException('Response status code is statusCode');
    }
  }

  @override
  Future<List<UserModel>> getEmployees(
      int offset, int limit, String accessToken) async {
    final response = await httpClient
        .get('${_apiUrl}/user/all/worker?limit=$limit&offset=$offset');

    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      // print("object");
      // myLongPrint(json.encode(data));
      return data["users"]
          .map<UserModel>((excursionItem) => UserModel.fromJson(excursionItem))
          .toList();
    } else {
      throw ServerException('Response status code is statusCode');
    }
  }

  @override
  Future<List<UserModel>> getUsers(
      int offset, int limit, String accessToken) async {
    print("SSSS");
    final response = await httpClient
        .get('${_apiUrl}/user/all/user?limit=$limit&offset=$offset');
    print(response);
    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      // print("object");
      // myLongPrint(json.encode(data));
      return data["users"]
          .map<UserModel>((excursionItem) => UserModel.fromJson(excursionItem))
          .toList();
    } else {
      throw ServerException('Response status code is statusCode');
    }
  }

  @override
  Future<void> deleteBooking(String id, String accessToken) async {
    httpClient.options.headers = {
      'Authorization': 'Bearer $accessToken',
      'Accept': '*/*'
    };
    final response = await httpClient.delete('${_apiUrl}/booking/$id');

    if (response.statusCode == 204) {
    } else {
      throw ServerException('Response status code is statusCode');
    }
  }

  @override
  Future<void> deleteService(String id, String accessToken) async {
    httpClient.options.headers = {
      'Authorization': 'Bearer $accessToken',
      'Accept': '*/*'
    };
    final response = await httpClient.delete('${_apiUrl}/service/$id');
    print(response.data);
    if (response.statusCode == 204) {
    } else {
      throw ServerException('Response status code is statusCode');
    }
  }

  @override
  Future<void> addEmployee(
      Map<String, dynamic> data, String accessToken) async {
    final response = await httpClient.post('${_apiUrl}/user/new', data: data);

    if (response.statusCode == 201) {
    } else {
      throw ServerException('Response status code is statusCode');
    }
  }

  @override
  Future<void> deleteEmployee(String id, String accessToken) async {
    httpClient.options.headers = {
      'Authorization': 'Bearer $accessToken',
      'Accept': '*/*'
    };
    // print(id);
    final response = await httpClient.delete('${_apiUrl}/user/$id');
    print(response.data);
    if (response.statusCode == 204) {
    } else {
      throw ServerException('Response status code is statusCode');
    }
  }
}
