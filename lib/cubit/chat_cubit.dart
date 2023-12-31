import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messengy/cubit/chat_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messengy/models/chat_model.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  // login and register ****************************************************
  UserCredential? userCreation;

  void createUser({
    required String email,
    required String password,
  }) async {
    try {
      userCreation = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(CreateUserSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        emit(WeekPasswordState(e.code));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        emit(EmailInUseState(e.code));
      }
    } catch (e) {
      print(e);
      emit(CreateUserErrorState(e.toString()));
    }
  }

  UserCredential? userLogin;

  void loginUser(
      {required String emailAddress, required String password}) async {
    try {
      userLogin = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      emit(LoginSuccessState(emailAddress));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        emit(LoginNoUserState());
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        emit(LoginWrongPasswordState());
      }
    }
  }

// login and register *************************************************

// chat page **********************************************************

  CollectionReference messagesRef =
      FirebaseFirestore.instance.collection('messages');

  void sendMessege({
    required String messege,
    required String userId,
    required String time,
  }) {
    messagesRef.add({
      'message': messege,
      'userId': userId,
      'time': time,
    }).then((value) {
      getMesseges();
    });
  }

  List<Chat> messagesList = [];
  void getMesseges() {
    messagesRef.orderBy('time', descending: true).snapshots().listen(
          (event) {
            messagesList.clear();
            for(int i =0; i< event.docs.length ; i++){
              messagesList.add(Chat.fromJson(event.docs[i]));
            }
            emit(GetMessagesState(messagesList));
          },
        );
  }

// chat page **********************************************************
}
