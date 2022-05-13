import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie/network/custom_exception.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie/network/url.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// class Provider extends GetConnect {
//   Future<List<dynamic>> getNowPlaying() async {
//     Map<String, String> headers = {
//       "Content-Type": "application/json",
//       "Accept": "application/json"
//     };

//     var queryParams = {
//       "api_key": Url.apiKey,
//     };

//     final response = await get('https://randomuser.me/api/?results=10',
//         headers: headers, query: queryParams);
//     if (response.status.hasError) {
//       return Future.error(response.statusText!);
//     } else {
//       return response.body['results'];
//     }
//   }
// }

class ApiProvider {
  final String movieDbBaseUrl = 'api.themoviedb.org';
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? params,
  }) async {
    dynamic responseJson;
    hasConnection();
    try {
      Map<String, String> headers = {
        // "api_key": Url.apiKey.toString()
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
      final response = await Dio().get(
        Uri.https(movieDbBaseUrl, url).toString(),
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      responseJson = _response(response);
    } on SocketException {
      // EasyLoading.showError('Gaada internet nih');
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      return e.error;
      // ignore: avoid_print
      print(e);
      // if (e.response!.statusCode == 404) {
      //   return e.response!.data;
      // } else if (e.response!.statusCode == 408) {
      //   return Fluttertoast.showToast(msg: "internet tidak tersedia");
      // } else if (e.response!.statusCode == 400) {
      //   Fluttertoast.showToast(msg: e.response!.data['message'].toString());
      //   return e.response!.data;
      // } else {
      //   Fluttertoast.showToast(
      //       msg: "ada kesalahan mohon tunggu beberapa saat lagi.");
      //   // return e.response!.data;
      // }
    }
    return responseJson;
  }

  // Future<dynamic> post(
  //   String url, {
  //   Map<String, dynamic>? body = const {},
  // }) async {
  //   dynamic responseJson;
  //   hasConnection();
  //   try {
  //     Map<String, String> headers = {
  //       "Content-Type": "application/json",
  //       "Accept": "application/json"
  //     };
  //     final Response response = await Dio().post(
  //       Uri.https(Url.movieDbBaseUrl, url).toString(),
  //       data: body,
  //       options: Options(
  //         headers: headers,
  //       ),
  //     );
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   } on DioError catch (e) {
  //     if (e.response!.statusCode == 404) {
  //       return Fluttertoast.showToast(
  //           msg: "ada kesalahan mohon tunggu beberapa saat lagi.");
  //     } else if (e.response!.statusCode == 408) {
  //       return Fluttertoast.showToast(msg: "No Internet connection");
  //     } else if (e.response!.statusCode == 400) {
  //       Fluttertoast.showToast(
  //           backgroundColor: Colors.red,
  //           msg: e.response!.data['message'].toString());
  //       return e.response!.data;
  //     } else {
  //       Fluttertoast.showToast(
  //           msg: "ada kesalahan mohon tunggu beberapa saat lagi.");
  //       return e.response!.data;
  //     }
  //   }
  //   return responseJson;
  // }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.data;

        return responseJson;
      case 408:
        Fluttertoast.showToast(msg: "No Internet connection");
        throw BadRequestException(response.data['message']);
      case 400:
        Fluttertoast.showToast(
            backgroundColor: Colors.red,
            msg: response.data['message'].toString());
        throw BadRequestException(response.data['message']);
      case 404:
        Fluttertoast.showToast(
            msg: "ada kesalahan mohon tunggu beberapa saat lagi.");
        throw BadRequestException(response.data['message']);
      case 401:
      case 403:
        throw UnauthorisedException(response.data['message']);
      case 500:
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }

  static Future<bool> hasConnection() async {
    bool hasWifi = false;
    bool hasMobileConnection = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      hasMobileConnection = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      hasWifi = true;
    }
    if (hasWifi == false && hasMobileConnection == false) {
      Fluttertoast.showToast(msg: "Tidak Ada Koneksi Internet");
    }
    return hasWifi || hasMobileConnection;
  }
}
