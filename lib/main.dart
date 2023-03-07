import 'package:bloc_practice/bloc/cubits/internet_cubit.dart';
import 'package:bloc_practice/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(),
        ),
        // BlocProvider(
        //   create: (context) => InternetBloc(),
        // )  using events
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          textTheme: const TextTheme(),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
