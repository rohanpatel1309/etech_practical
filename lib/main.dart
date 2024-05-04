import 'dart:async';
import 'dart:developer';

import 'package:etech_demo/bloc_observer.dart';
import 'package:etech_demo/provider/realm_config.dart';
import 'package:etech_demo/view/user_listview.dart';
import 'package:etech_demo/viewmodel/userviewmodel/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  runZonedGuarded((){
    RealmConfig.init();
    Bloc.observer = AppBlocObserver();
    runApp(const MyApp());
  }, (error, stack) {
    log(error.toString());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(FetchUsers()),
      child: ScreenUtilInit(
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: const UserLitView(),
          );
        },
      ),
    );
  }
}

