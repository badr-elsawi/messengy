abstract class ChatStates {}
class ChatInitialState extends ChatStates {}
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