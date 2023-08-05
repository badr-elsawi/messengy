import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messengy/cubit/chat_cubit.dart';
import 'package:messengy/cubit/chat_states.dart';
import 'package:messengy/shared/components/chat_bubble.dart';
import '../../shared/components/text_input.dart';

class ChatScreen extends StatelessWidget {
  var message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = ChatCubit.get(context);
    return BlocConsumer<ChatCubit, ChatStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xff120818),
          appBar: AppBar(),
          body: ListView.separated(
            padding: EdgeInsetsDirectional.symmetric(
                vertical: 10.h, horizontal: 20.w),
            itemBuilder: (context, index) => ChatBubble(
              isYou: index % 2 == 0 ? false : true,
              text: 'this is ',
            ),
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount: 1,
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
                  // cubit.sendMessege(
                  //   messege: message.text,
                  //   time: DateTime.now().day.toString(),
                  // );
                  // message.clear();
                  cubit.getMesseges();
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
