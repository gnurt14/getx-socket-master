import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:socket_wa/app/models/model.dart';
import 'package:socket_wa/app/modules/chat/views/chat_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  List<ChatModel> chatmodels;
  ChatModel sourceChat;
  HomeView({this.chatmodels,this.sourceChat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: chatmodels.length,
        itemBuilder: (contex, index) => InkWell(
          onTap: () {
            print(sourceChat.id.toString());
            print(sourceChat.name.toString());
            Get.to(ChatView(
              chatModel: chatmodels[index],
              sourceChat: sourceChat,
            ));
          },
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: SvgPicture.asset(
                    chatmodels[index].isGroup ? "assets/groups.svg" : "assets/person.svg",
                    color: Colors.white,
                    height: 36,
                    width: 36,
                  ),
                  backgroundColor: Colors.blueGrey,
                ),
                title: Text(
                  chatmodels[index].name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.done_all),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      chatmodels[index].currentMessage,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                trailing: Text(chatmodels[index].time),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 80),
                child: Divider(
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
