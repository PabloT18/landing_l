import 'package:equatable/equatable.dart';

class Song extends Equatable {
  const Song({
    required this.title,
    this.isSelected = false,
    required this.filePath,
  });
  final String title;
  final bool isSelected;
  final String filePath;

  @override
  List<Object?> get props => [title, isSelected, filePath];

  Song copyWith({
    String? title,
    bool? isSelected,
  }) {
    return Song(
      title: title ?? this.title,
      isSelected: isSelected ?? this.isSelected,
      filePath: filePath,
    );
  }
}
