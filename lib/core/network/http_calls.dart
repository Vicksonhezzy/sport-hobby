import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sportbuddy/core/utils/progress_dialog_utils.dart';

import '../constants/constants.dart';

import 'package:http/http.dart' as http;

Future<dynamic> httpPost(
    {required String url, required BuildContext context, dynamic body}) async {
  print('body = $body');
  var header = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer '
  };
  print('header = $header');
  try {
    var res = await http.post(Uri.parse(baseUrl + url),
        body: json.encode(body), headers: header);
    print('data = ${res.body}');
    var data = json.decode(res.body);
    if (res.statusCode == 200) {
      return {'success': true, 'data': data};
    }
    snackbar(context, msg: data['message']);
    return {'success': false, 'data': data};
  } catch (e) {
    // print('e = $e');
    snackbar(context, msg: e.toString());
    print('error = ${e.toString()}');
    return {'success': false, 'data': e.toString()};
  }
}

Future<dynamic> httpGet(
    {required String url, required BuildContext context}) async {
  var header = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ',
  };
  print('header = $header');
  try {
    var res = await http.get(Uri.parse(baseUrl + url), headers: header);
    print('data = ${res.body}');
    var data = json.decode(res.body);
    if (res.statusCode == 200) {
      return {'success': true, 'data': data};
    }
    snackbar(context, msg: data['message']);
    return {'success': false, 'data': data};
  } catch (e) {
    snackbar(context, msg: e.toString());
    print('error = ${e.toString()}');
    throw e.toString();
  }
}
