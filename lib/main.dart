import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messengy/cubit/chat_cubit.dart';
import 'package:messengy/screens/chat_screen/chat_screen.dart';
import 'package:messengy/screens/login_screen/login_screen.dart';
import 'package:messengy/shared/cubit/app_cubit.dart';
import 'package:messengy/shared/cubit/app_states.dart';
import 'package:messengy/shared/styles/styles.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()),
        BlocProvider(create: (BuildContext context) => ChatCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'messengy',
                theme: darkTheme,
                home: ChatScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
