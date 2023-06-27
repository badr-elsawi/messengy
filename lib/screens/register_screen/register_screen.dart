import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messengy/cubit/chat_cubit.dart';
import 'package:messengy/cubit/chat_states.dart';
import 'package:messengy/screens/login_screen/login_screen.dart';
import 'package:messengy/shared/components/snack_bar.dart';
import 'package:messengy/shared/components/text_input.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';

class RegisterScreen extends StatelessWidget {
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<ChatCubit, ChatStates>(
      listener: (context, state) {
        if (state is CreateUserSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(mySnack(
              messege: 'Email created successfully',
              actionText: 'Login',
              onAction: () {
                Navigator.pop(context);
              }));
        }
        if (state is WeekPasswordState) {
          ScaffoldMessenger.of(context).showSnackBar(mySnack(messege: 'week password try agian'));
        }
        if (state is CreateUserErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(mySnack(messege: 'email alreadu in use'));
        }
      },
      builder: (context, state) {
        var cubit = ChatCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  PageTransition(
                    child: LoginScreen(),
                    duration: Duration(milliseconds: 700),
                    type: PageTransitionType.topToBottom,
                  ),
                );
              },
              icon: Icon(
                LineIcons.chevronCircleDown,
                size: width / 10,
              ),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'CREATE ACCOUNT',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  MyTextInput(
                    controller: email,
                    style: TextStyle(color: Colors.white),
                    hintText: 'email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  SizedBox(height: 20),
                  MyTextInput(
                    controller: password,
                    style: TextStyle(color: Colors.white),
                    hintText: 'password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      cubit.createUser(
                        email: email.text,
                        password: password.text,
                      );
                    },
                    child: Text('Sign up'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
