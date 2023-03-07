import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetStates {
  initial,
  gained,
  lost,
}

class InternetCubit extends Cubit<InternetStates> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetStates.initial) {
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetStates.gained);
      } else {
        emit(InternetStates.lost);
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription!.cancel();
    return super.close();
  }
}
