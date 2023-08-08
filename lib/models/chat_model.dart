class Chat {
  late String? messege;
  String? time;

  Chat.fromJson(json){
    messege = json['message'];
    time = json['time'];
  }
}