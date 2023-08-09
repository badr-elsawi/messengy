import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messengy/cubit/chat_cubit.dart';
import 'package:messengy/cubit/chat_states.dart';
import 'package:messengy/shared/components/chat_bubble.dart';
import '../../models/chat_model.dart';
import '../../shared/components/text_input.dart';

class ChatScreen extends StatelessWidget {
  late String userId;
  ChatScreen(this.userId);
  var message = TextEditingController();
  var listController = ScrollController();
  CollectionReference messeges =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messeges.orderBy('time', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Chat> chat = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            chat.add(Chat.fromJson(snapshot.data!.docs[i]));
          }
          // print(chat);
          // print(snapshot.data!.docs[0]['message']);
          return Scaffold(
            backgroundColor: Color(0xff120818),
            appBar: AppBar(),
            body: ListView.separated(
              physics: BouncingScrollPhysics(),
              reverse: true,
              controller: listController,
              padding: EdgeInsetsDirectional.only(
                top: 10.h,
                start: 20.w,
                end: 20.w,
                bottom: 80.h,
              ),
              itemBuilder: (context, index) => ChatBubble(
                isYou: chat[index].userId == userId ? true : false,
                text: chat[index].messege!,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: chat.length,
            ),
            bottomSheet: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              width: double.infinity,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: MyTextInput(
                controller: message,
                style: TextStyle(color: Colors.white),
                hintText: 'type something',
                errorHint: 'email is required',
                suffix: IconButton(
                  onPressed: () {
                    messeges.add(
                      {
                        'message': message.text,
                        'userId': userId,
                        'time': DateTime.now().toString(),
                      },
                    );
                    message.clear();
                    listController.animateTo(
                      0,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeIn,
                    );
                  },
                  icon: Icon(Icons.send),
                ),
                maxLines: 5,
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('No data...!'),
            ),
          );
        }
      },
    );
  }
}
