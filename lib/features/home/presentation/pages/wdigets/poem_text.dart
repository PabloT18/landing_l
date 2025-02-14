import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PoemText extends StatelessWidget {
  const PoemText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.dancingScript(
              fontSize: 26,
              color: Colors.black87,
            ),
            children: [
              const TextSpan(
                text: '''El dado cayó, y el destino marcó el seis,
aquel domingo con los rostros al viento,
nació nuestra historia, un café como encuentro.
Llegó el ocho, bajo dos perspectivas,
un número de lado, infinito en su vida.
¿Cuánto te amo? Más de lo que imaginas.
Hasta el infinito y más allá,
hasta siempre y para siempre,
eres mi anomalía gravitacional,
que me cuida y protege.
Sumando caminos, un nuevo catorce,
destino trazado, latidos y suerte.
Flecha en el pecho, pasión que no muere,
cariño de león en caricia sincera.\n\n''',
              ),
              TextSpan(
                text: 'Te Amo Siempre\n\n',
                style: GoogleFonts.dancingScript(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
