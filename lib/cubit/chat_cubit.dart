import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messengy/cubit/chat_states.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  UserCredential? user;

  void createUser({
    required String email,
    required String password,
  }) async {
    try {
      user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
}
