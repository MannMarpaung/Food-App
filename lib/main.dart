import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/cubit/cubit.dart';
import 'package:food_app/ui/pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserCubit(),
        ),
        BlocProvider(
          create: (_) => FoodCubit(),
        ),
        BlocProvider(
          create: (_) => TransactionCubit(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const SignInPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
