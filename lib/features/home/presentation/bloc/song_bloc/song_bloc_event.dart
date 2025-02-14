part of 'song_bloc_bloc.dart';

sealed class SongEvent extends Equatable {
  const SongEvent();

  @override
  List<Object> get props => [];
}

class SongSelected extends SongEvent {
  final Song song;

  const SongSelected(this.song);

  @override
  List<Object> get props => [song];
}
