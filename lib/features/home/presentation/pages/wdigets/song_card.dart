import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_l/core/config/responsive/responsive_class.dart';

import 'package:landing_l/core/config/theme/app_colors.dart';
import 'package:landing_l/features/home/domain/models/song.dart';
import 'package:landing_l/features/home/presentation/bloc/song_bloc/song_bloc_bloc.dart';

class SongCard extends StatefulWidget {
  const SongCard({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  SongCardState createState() => SongCardState();
}

class SongCardState extends State<SongCard> {
  bool isHover = false;
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final songBloc = context.watch<SongBloc>();
    final bool isSelected =
        songBloc.state.cancioneSeleccionada?.title == widget.song.title;

    return SizedBox(
      width: 120, // Tamaño fijo para todos
      height: 60, // Tamaño fijo para todos
      child: InkWell(
        hoverColor: Colors.transparent,
        // splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          context
              .read<SongBloc>()
              .add(SongSelected(widget.song)); // Emitir evento de selección
        },
        onTapCancel: () {
          if (!isHover) {
            setState(() => isTapped = false);
          }
        },
        onTapUp: (details) {
          if (!isHover) {
            setState(() => isTapped = false);
          }
        },
        onTapDown: (details) {
          if (!isHover) {
            setState(() => isTapped = true);
          }
        },
        onHover: (isHovering) {
          if (isHovering) {
            setState(() => isHover = true);
          } else {
            setState(() => isHover = false);
          }
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            // gradient: isHover || isTapped
            //     ? AppColors.blueGradient
            //     : AppColors.grayBack,
            gradient: isSelected
                ? AppColors.blueGradient.withOpacity(
                    0.8) // Cambia el color cuando está seleccionado
                : isHover || isTapped
                    ? AppColors.blueGradient.withOpacity(0.6)
                    : AppColors.grayBack.withOpacity(0.4),
            borderRadius:
                BorderRadius.circular(AppLayoutConst.cardBorderRadius),
            // boxShadow: isHover || isTapped
            //     ? [AppColors.primaryColorShadow]
            //     : [AppColors.blackColorShadow],
            boxShadow: isSelected
                ? [
                    AppColors.primaryColorShadow
                  ] // Sombra más intensa si está seleccionado
                : [AppColors.blackColorShadow],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.song.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? Colors.white
                            : isHover || isTapped
                                ? Colors.white
                                : Colors.blueGrey[100]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
