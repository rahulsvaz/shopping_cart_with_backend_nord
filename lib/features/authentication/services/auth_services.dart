// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:shopping_cart_with_node/common/constants/error_handling.dart';
import 'package:shopping_cart_with_node/common/constants/utils.dart';
import 'package:shopping_cart_with_node/global_variables/global_variables.dart';
import 'package:shopping_cart_with_node/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
// Sign up user

  void signUpUser(
      {required String email,
      required String name,
      required String password,
      required BuildContext context}) async {
    try {
      User user = User(
          id: '',
          email: email,
          password: password,
          name: name,
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-type': 'application/json;charset=UTF-8'

            /*    Here, we are defining a Map to represent the headers of 
                  an HTTP request. In Dart, HTTP headers are often 
                  represented as a Map with keys and values, where both the 
                  keys and values are strings. */
          });

      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () {
            showSnackbar(context,
                'Account Has Been Created You Can Login With Same Credentials');
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}