import 'package:get/get.dart';
import 'package:socket_wa/app/models/model.dart';

class LoginController extends GetxController {
  ChatModel sourceChat;
  // var chatmodels = List<ChatModel>.empty(growable: true).obs;
  List<ChatModel> chatmodels = [];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    addDataUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void addDataUser() {
    chatmodels.add(new ChatModel(
      name: "Bayu",
      isGroup: false,
      currentMessage: "Hi Everyone",
      time: "4:00",
      icon: "person.svg",
      id: 1,
    ));
    chatmodels.add(new ChatModel(
      name: "Nugroho",
      isGroup: false,
      currentMessage: "Hi Everyone",
      time: "4:00",
      icon: "person.svg",
      id: 2,
    ));
    update();
  }
}
