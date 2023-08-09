class Chat {
  late String? messege;
  late String? userId;
  String? time;

  Chat.fromJson(json){
    messege = json['message'];
    userId = json['userId'];
    time = json['time'];
  }
}