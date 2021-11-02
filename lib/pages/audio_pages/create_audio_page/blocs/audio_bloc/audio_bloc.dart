import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  AudioBloc() : super(AudioInitial());

  @override
  Stream<AudioState> mapEventToState(
    AudioEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
