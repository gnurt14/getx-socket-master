import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_wa/app/models/model.dart';

class ChatController extends GetxController {
  final show = false.obs;
  FocusNode focusNode = FocusNode();
  final sendButton = false.obs;
  RxList<MessageModel> messages = RxList<MessageModel>();
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();
  IO.Socket socket;

  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        show.value = false;
        update();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void connect(int sourchatId) {
    socket = IO.io("http://192.168.1.12:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("signin", sourchatId);
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        setMessage("destination", msg["message"]);
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    update();
    print(" isconnect " + socket.connected.toString());
  }

  void setMessage(String type, msg) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: msg,
        time: DateTime.now().toString().substring(10, 16));
    messages.add(messageModel);
    update();
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
    update();
  }
}
