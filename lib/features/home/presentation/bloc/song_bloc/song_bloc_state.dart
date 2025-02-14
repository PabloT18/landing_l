part of 'song_bloc_bloc.dart';

class SongState extends Equatable {
  const SongState({
    required this.canciones,
    this.cancioneSeleccionada,
  });

  final List<Song> canciones;
  final Song? cancioneSeleccionada;

  SongState copyWith({
    List<Song>? canciones,
    Song? cancioneSeleccionada,
  }) {
    return SongState(
      canciones: canciones ?? this.canciones,
      cancioneSeleccionada: cancioneSeleccionada ?? this.cancioneSeleccionada,
    );
  }

  @override
  List<Object?> get props => [canciones, cancioneSeleccionada];
}
