import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegisterFormView extends GetView {
  const RegisterFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterFormView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegisterFormView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
