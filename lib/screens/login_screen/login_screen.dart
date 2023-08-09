import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messengy/cubit/chat_cubit.dart';
import 'package:messengy/cubit/chat_states.dart';
import 'package:messengy/screens/chat_screen/chat_screen.dart';
import 'package:messengy/screens/register_screen/register_screen.dart';
import 'package:messengy/shared/components/snack_bar.dart';
import 'package:messengy/shared/components/text_input.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatelessWidget {
  var emailAddress = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<ChatCubit, ChatStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnack(
              messege: 'Logged in successfully',
            ),
          );
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatScreen(state.userId)));
        }
        if (state is LoginWrongPasswordState) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnack(
              messege: 'wrong password',
            ),
          );
        }
        if (state is LoginNoUserState) {
          ScaffoldMessenger.of(context).showSnackBar(
            mySnack(
              messege: 'email not found',
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = ChatCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics: BouncingScrollPhysics(),
              child: Form(
                key: formKey,
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
                      controller: emailAddress,
                      style: TextStyle(color: Colors.white),
                      hintText: 'email',
                      prefixIcon: Icon(Icons.email),
                      errorHint: 'email is required',
                    ),
                    SizedBox(height: 20),
                    MyTextInput(
                      controller: password,
                      style: TextStyle(color: Colors.white),
                      hintText: 'password',
                      prefixIcon: Icon(Icons.lock),
                      errorHint: 'password is required',
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.loginUser(
                            emailAddress: emailAddress.text,
                            password: password.text,
                          );
                        }
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
          ),
        );
      },
    );
  }
}
