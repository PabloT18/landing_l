import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_l/features/home/domain/models/song.dart';
import 'package:url_launcher/url_launcher.dart';

part 'song_bloc_event.dart';
part 'song_bloc_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  SongBloc()
      : super(SongState(canciones: [
          Song(
              title: 'Cama y Mesa',
              filePath: 'https://www.youtube.com/watch?v=U644P4v2GF0'),
          Song(
              title: 'Celos',
              filePath: 'https://www.youtube.com/watch?v=X-yZDRIhcHY'),
          Song(
              title: 'Eres Mi Persona Favorita',
              filePath: 'https://www.youtube.com/watch?v=x-0KoCAV4mc'),
          Song(
              title: 'Aprender a Quererte',
              filePath: 'https://www.youtube.com/watch?v=OukQDrJ7QRQ'),
          Song(
              title: 'Si Nos Dejan',
              filePath: 'https://www.youtube.com/watch?v=_U89Bl5okPw'),
          Song(
              title: 'Día Tras Día',
              filePath: 'https://www.youtube.com/watch?v=5AwREc040vw'),
          Song(
              title: 'Bendita Tu Luz',
              filePath: 'https://www.youtube.com/watch?v=44kityInDvM'),
          Song(
              title: 'Río',
              filePath: 'https://www.youtube.com/watch?v=vuddlpgY5J4'),
          Song(
              title: 'Imagínate',
              filePath: 'https://www.youtube.com/watch?v=TVyLcqNg5lY'),
        ], cancioneSeleccionada: null)) {
    on<SongSelected>(_onSongSelected);

    // Seleccionar la primera canción automáticamente
    // add(SongSelected(state.canciones.first));
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
    await _openUrl(event.song.filePath);
  }

  // Future<void> _playSong(String filePath) async {
  //   await _audioPlayer.stop(); // Detener la canción actual
  //   // await _audioPlayer.play(AssetSource(filePath)); // Reproducir la nueva
  //   // await _audioPlayer.play(UrlSource(filePath));
  //   await _openUrl(event.song.filePath);
  // }

  Future<void> _openUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose(); // Liberar recursos del audio
    return super.close();
  }
}
