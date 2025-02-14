import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_l/core/config/responsive/responsive_class.dart';
import 'package:landing_l/core/config/responsive/responsive_wid.dart';
import 'package:landing_l/features/home/presentation/bloc/song_bloc/song_bloc_bloc.dart';
import 'package:landing_l/features/home/presentation/pages/wdigets/song_card.dart';

class FloatingQuickAccessBar extends StatelessWidget {
  const FloatingQuickAccessBar({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCustom.of(context);

    return BlocBuilder<SongBloc, SongState>(
      builder: (context, state) {
        return Center(
          heightFactor: 1,
          child: Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.06,
              left: responsive.wp(responsive.movil ? 5 : 20),
              right: responsive.wp(responsive.movil ? 5 : 20),
            ),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height / 50,
                  horizontal: 10,
                ),
                child: ResponsiveWid(
                  desktop: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 15,
                    runSpacing: 15,
                    children: List.generate(state.canciones.length,
                        (index) => SongCard(song: state.canciones[index])),
                  ),
                  tablet: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(state.canciones.length,
                        (index) => SongCard(song: state.canciones[index])),
                  ),
                  mobile: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 5,
                    runSpacing: 5,
                    children: List.generate(state.canciones.length,
                        (index) => SongCard(song: state.canciones[index])),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
