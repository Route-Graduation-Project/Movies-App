import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<T, A, N> extends Cubit<T> {
  BaseCubit(super.initialState);

  Future<void> doAction(A action);

  final StreamController<N> _navigationStream = StreamController.broadcast();
  Stream<N> get navigation => _navigationStream.stream;

  void emitNavigation(N navigationEvent) {
    _navigationStream.add(navigationEvent);
  }

  @override
  Future<void> close() {
    _navigationStream.close();
    return super.close();
  }
}
