import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messengy/cubit/chat_cubit.dart';
import 'package:messengy/cubit/chat_states.dart';
import 'package:messengy/screens/register_screen/register_screen.dart';
import 'package:messengy/shared/components/snack_bar.dart';
import 'package:messengy/shared/components/text_input.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatelessWidget {
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<ChatCubit, ChatStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    width: width / 3,
                    image: AssetImage('assets/images/chat.png'),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 40,
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        mySnack(
                          messege: 'email is already in use',
                          actionText: 'got it',
                          onAction: (){},
                        ),
                      );
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: RegisterScreen(),
                          duration: Duration(milliseconds: 700),
                          type: PageTransitionType.bottomToTop,
                        ),
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
