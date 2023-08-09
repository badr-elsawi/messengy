import '../models/chat_model.dart';

abstract class ChatStates {}
class ChatInitialState extends ChatStates {}
// ************************************************************
class CreateUserSuccessState extends ChatStates {}
class WeekPasswordState extends ChatStates {
  WeekPasswordState(String error);
}
class EmailInUseState extends ChatStates {
  EmailInUseState(String error);
}
class CreateUserErrorState extends ChatStates {
  CreateUserErrorState(String error);
}
// ***************************************************************
class LoginSuccessState extends ChatStates {
  late String userId ;
  LoginSuccessState(this.userId);
}
class LoginWrongPasswordState extends ChatStates {}
class LoginNoUserState extends ChatStates {}
// ***************************************************************
class GetMessagesState extends ChatStates {
  List<Chat> messagesList ;
  GetMessagesState(this.messagesList);
}