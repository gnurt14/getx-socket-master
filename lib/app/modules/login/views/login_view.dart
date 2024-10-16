import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:socket_wa/app/modules/home/views/home_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: controller.chatmodels.length,
          itemBuilder: (contex, index) => InkWell(
            onTap: () {
              controller.sourceChat = controller.chatmodels.removeAt(index);
              Get.to(HomeView(chatmodels:controller.chatmodels,sourceChat:controller.sourceChat));
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 23,
                child: Icon(
                  Icons.person,
                  size: 26,
                  color: Colors.white,
                ),
                backgroundColor: Color(0xFF25D366),
              ),
              title: Text(
                controller.chatmodels[index].name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
    );
  }
}
