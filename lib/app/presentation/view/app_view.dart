import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:landing_l/core/config/responsive/responsive_class.dart';
import 'package:landing_l/core/config/responsive/responsive_wid.dart';
import 'package:landing_l/features/home/home.dart';
import 'package:landing_l/features/home/presentation/pages/video_backgorund.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'L&P',
      home: HomePage(),
    );
  }
}

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  // final ScrollController _scrollController = ScrollController();

  // bool isYesFirst = true; // Controla el orden de los botones

  @override
  void initState() {
    super.initState();

    // // Iniciar el scroll automático después de 2 segundos
    // Future.delayed(const Duration(seconds: 2), () {
    //   if (_scrollController.hasClients) {
    //     // Desplazarse la altura de un card
    //     _scrollController.animateTo(
    //       100.0, // Altura del card
    //       duration: const Duration(milliseconds: 500),
    //       curve: Curves.easeInOut,
    //     );
    //   }
    // });
  }

  @override
  void dispose() {
    // _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCustom.of(context);

    // Widget botones = Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: isYesFirst
    //       ? [buildSiButton(), const SizedBox(width: 20), buildNoButton()]
    //       : [buildNoButton(), const SizedBox(width: 20), buildSiButton()],
    // );

    Widget vistaMobile = SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: VideoAsset(),
          ),
          Center(child: Text("dsfasdfasdfasdfasfasfa")),
          SizedBox(
            height: 100,
            width: 200,
            child: Card(
              color: Colors.red,
            ),
          )
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: ResponsiveWid(
          desktop: Stack(
            fit: StackFit.expand,
            children: [
              SizedBox(
                child: VideoAsset(),
              ),
              Center(child: Text("dsfasdfasdfasdfasfasfa")),
              // SizedBox(
              //   height: 100,
              //   width: 200,
              //   child: Card(
              //     color: Colors.red,
              //   ),
              // )
            ],
          ),
          tablet: vistaMobile,
          mobile: vistaMobile),
    );
  }

  // Widget buildSiButton() {
  //   return ElevatedButton(
  //     onPressed: _showAlertDialog,
  //     child: const Text("SI"),
  //   );
  // }

  // Widget buildNoButton() {
  //   return ElevatedButton(
  //     onPressed: () {
  //       setState(() {
  //         isYesFirst = !isYesFirst; // Invierte el orden de los botones
  //       });
  //     },
  //     child: const Text("NO"),
  //   );
  // }

  // void _showAlertDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text("¡Alerta!"),
  //         content: const Text("Has presionado el botón SI."),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Cierra el diálogo
  //             },
  //             child: const Text("Cerrar"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
