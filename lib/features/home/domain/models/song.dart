import 'dart:async';

import 'package:equatable/equatable.dart';

class Song extends Equatable {
  const Song({
    required this.title,
    required this.isSelected,
  });
  final String title;
  final bool isSelected;

  @override
  List<Object?> get props => [title, isSelected];

  Song copyWith({String? title, bool? isSelected}) {
    return Song(
      title: title ?? this.title,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
