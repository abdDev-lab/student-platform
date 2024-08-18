import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:progres/core/class/statusRequest.dart';
import 'package:progres/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Map<String, String> myheaders = {
    'authorization':
        'Basic ' + base64Encode(utf8.encode('abdouDev:27112004@Api'))
  };
  Future<Either<StatusRequest, Map>> postRequest(String link, Map data) async {
    try {
      if (await checkinternet()) {
        var response =
            await http.post(Uri.parse(link), body: data, headers: myheaders);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serveroffline);
        }
      }else{
        return const Left(StatusRequest.offline);
      }
    } catch (e) {
      print(e);
      return const Left(StatusRequest.serveroffline);
    }
  }
  
}
