import 'dart:developer';

import 'package:etech_demo/model/remote/user.dart';
import 'package:etech_demo/provider/api_utils.dart';
import 'package:http/http.dart';
import 'package:dartz/dartz.dart';

class ApiProvider {
  /// fetch user
  Future<Either<List<User>, String>> fetchUser(
      {required int pageNo, required int perPage}) async {
    try {
      final response = await get(
          Uri.parse("${ApiUtils.issueEndPoint}per_page=$perPage&page=$pageNo"));

      if (response.statusCode == 200) {
        return left(userListFromJson(response.body));
      } else {
        return right("error");
      }
    } catch (e) {
      log("Error : $e");
      return right("Error");
    }
  }
}
