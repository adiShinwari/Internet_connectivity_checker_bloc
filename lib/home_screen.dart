import 'package:bloc_practice/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_practice/bloc/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 27, 27),
      appBar: AppBar(
        title: const Text('Bloc'),
      ),
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Internet Connected'),
                  backgroundColor: Colors.green,
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Internet Disconnected'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text(
                'Internet connected',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              );
            } else if (state is InternetLostState) {
              return const Text(
                'Internet disconnected',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              );
            } else {
              return const Text(
                'Loading...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
