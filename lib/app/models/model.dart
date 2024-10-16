/**
 * Created by Bayu Nugroho
 * Copyright (c) 2021 . All rights reserved.
 */

class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  String status;
  bool select = false;
  int id;
  ChatModel({
    this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.currentMessage,
    this.status,
    this.select = false,
    this.id,
  });
}

class MessageModel {
  String type;
  String message;
  String time;
  MessageModel({this.message, this.type, this.time});
}

