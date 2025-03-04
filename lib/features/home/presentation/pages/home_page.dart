import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landing_l/core/config/responsive/responsive_layouts.dart';
import 'package:landing_l/core/config/responsive/responsive_wid.dart';
import 'package:landing_l/core/config/router/app_routes_assets.dart';

import 'package:landing_l/features/home/presentation/pages/images_animatied.dart';
import 'package:landing_l/features/home/presentation/pages/wdigets/poem_text.dart';

import '../bloc/song_bloc/song_bloc_bloc.dart';
import 'carousel.dart';
import 'featured_tiles.dart';
import 'floating_quick_access_bar.dart';
import 'video_backgorund.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final ScrollController _scrollController = ScrollController();

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (_scrollController.hasClients) {
        // Desplazarse la altura de un card
        _scrollController.animateTo(
          100.0, // Altura del card
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return BlocProvider(
      create: (context) => SongBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              VideoAsset(),
              SizedBox(height: AppLayoutConst.spaceXL),
              Text(
                'Listado de nuestras canciones',
                style: GoogleFonts.dancingScript(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),

              FloatingQuickAccessBar(screenSize: screenSize),
              // FeaturedTiles(screenSize: screenSize),
              // MainCarousel(),
              SizedBox(height: AppLayoutConst.spaceXL),

              Text(
                'Nuestros momentos',
                style: GoogleFonts.dancingScript(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: AppLayoutConst.spaceM),
              ImagesAnimation(),
              ResponsiveImage(),
              PoemText(),
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveImage extends StatelessWidget {
  const ResponsiveImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWid(
      desktop: Center(
        child: Image.asset(
          AppAssets.lsuma,
          width: 500, // Tamaño más grande para escritorio
          height: 300,
          fit: BoxFit.contain,
        ),
      ),
      tablet: Center(
        child: Image.asset(
          AppAssets.lsuma,
          width: 350, // Tamaño intermedio para tablet
          height: 250,
          fit: BoxFit.contain,
        ),
      ),
      mobile: Center(
        child: Image.asset(
          AppAssets.lsuma,
          width: 250, // Tamaño más pequeño para móvil
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
