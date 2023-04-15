import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:sportbuddy/core/app_export.dart';

import '../../../core/network/http_calls.dart';
import '../../log_in_screen/models/log_in_model.dart';

class ProfileController extends GetxController {
  late Timer timer;

  late BuildContext contexts;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      getUserById();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    timer.cancel();
  }

  getUserById() async {
    var _res =
        await httpGet(url: 'users/getUserById/${user.id}', context: contexts);
    if (_res['success']) {
      user = UserModel.fromJson(_res['data']);
      update();
    }
    return;
  }
}
