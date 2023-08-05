import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChatBubble extends StatelessWidget {
  bool isYou;
  String text;
  ChatBubble({
    required this.isYou,
    required this.text,
});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isYou ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        // alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: isYou ? Color(0xffFA6450).withOpacity(0.2) : Color(0xff281436),
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(25).w,
            topStart: Radius.circular(25).w,
            bottomEnd: isYou ? Radius.circular(0).w : Radius.circular(25).w,
            bottomStart: isYou ? Radius.circular(25).w : Radius.circular(0).w,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
