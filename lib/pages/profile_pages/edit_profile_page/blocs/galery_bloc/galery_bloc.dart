import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'galery_event.dart';
part 'galery_state.dart';

class GaleryBloc extends Bloc<GaleryEvent, GaleryState> {
  GaleryBloc() : super(GaleryInitial());

  @override
  Stream<GaleryState> mapEventToState(
    GaleryEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
