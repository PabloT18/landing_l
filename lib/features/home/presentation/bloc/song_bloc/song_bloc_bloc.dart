import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_l/features/home/domain/models/song.dart';

part 'song_bloc_event.dart';
part 'song_bloc_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  SongBloc()
      : super(SongState(canciones: [
          Song(title: 'Cama y Mesa', isSelected: false),
          Song(title: 'Celos', isSelected: false),
          Song(title: 'Eres Mi Persona Favorita', isSelected: false),
          Song(title: 'Aprender a Quererte', isSelected: false),
          Song(title: 'Si Nos Dejan', isSelected: false),
          Song(title: 'Día Tras Día', isSelected: false),
          Song(title: 'Bendita Tu Luz', isSelected: false),
          Song(title: 'Río', isSelected: false),
        ], cancioneSeleccionada: null)) {
    on<SongSelected>(_onSongSelected);

    // Seleccionar la primera canción automáticamente
    add(SongSelected(state.canciones.first));
  }

  FutureOr<void> _onSongSelected(
      SongSelected event, Emitter<SongState> emit) async {
    final List<Song> canciones = state.canciones.map((e) {
      if (e.title == event.song.title) {
        return e.copyWith(isSelected: true);
      } else {
        return e.copyWith(isSelected: false);
      }
    }).toList();
    emit(
        state.copyWith(canciones: canciones, cancioneSeleccionada: event.song));
  }
}
