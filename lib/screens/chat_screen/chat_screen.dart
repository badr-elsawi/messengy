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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ChatCubit.get(context);
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
              isYou: cubit.messagesList[index].userId == userId ? true : false,
              text: cubit.messagesList[index].messege!,
            ),
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount: cubit.messagesList.length,
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
                  cubit.sendMessege(
                    messege: message.text,
                    userId: userId,
                    time: DateTime.now().toString(),
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
      },
    );
  }
}
