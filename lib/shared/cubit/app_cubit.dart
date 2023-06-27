import 'package:bloc/bloc.dart';
import 'package:messengy/shared/cubit/app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
}