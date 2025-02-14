import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_l/features/home/domain/models/song.dart';

part 'song_bloc_event.dart';
part 'song_bloc_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  SongBloc()
      : super(SongState(canciones: [
          Song(
              title: 'Cama y Mesa',
              filePath:
                  'https://drive.google.com/uc?export=download&id=1jraNn-QDyaHEQ59n1XpdTu_5qUM0hHBG'),
          Song(
              title: 'Celos',
              filePath:
                  'https://drive.google.com/file/d/1jraNn-QDyaHEQ59n1XpdTu_5qUM0hHBG/view?usp=sharing'),
          Song(
              title: 'Eres Mi Persona Favorita',
              filePath: 'assets/songs/eres_mi_persona_favorita.mp3'),
          Song(
              title: 'Aprender a Quererte',
              filePath: 'assets/songs/aprender_a_quererte.mp3'),
          Song(
              title: 'Si Nos Dejan', filePath: 'assets/songs/si_nos_dejan.mp3'),
          Song(
              title: 'Día Tras Día', filePath: 'assets/songs/dia_tras_dia.mp3'),
          Song(
              title: 'Bendita Tu Luz',
              filePath: 'assets/songs/bendita_tu_luz.mp3'),
          Song(title: 'Río', filePath: 'assets/songs/rio.mp3'),
          Song(title: 'Imagínate', filePath: 'assets/songs/imaginate.mp3'),
        ], cancioneSeleccionada: null)) {
    on<SongSelected>(_onSongSelected);

    // Seleccionar la primera canción automáticamente
    add(SongSelected(state.canciones.first));
  }

  final AudioPlayer _audioPlayer = AudioPlayer(); // Instancia de AudioPlayer

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

    // Reproducir la nueva canción
    // await _playSong(event.song.filePath);
  }

  Future<void> _playSong(String filePath) async {
    await _audioPlayer.stop(); // Detener la canción actual
    // await _audioPlayer.play(AssetSource(filePath)); // Reproducir la nueva
    await _audioPlayer.play(UrlSource(filePath));
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose(); // Liberar recursos del audio
    return super.close();
  }
}
