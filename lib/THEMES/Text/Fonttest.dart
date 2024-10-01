import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class fontss extends StatefulWidget {
  const fontss({super.key});

  @override
  State<fontss> createState() => _fontssState();
}

class _fontssState extends State<fontss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Fonts Example', style: GoogleFonts.lato()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This is Lato',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'This is Roboto',
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'This is Pacifico',
                style: GoogleFonts.pacifico(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'This is Open Sans',
                style: GoogleFonts.openSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'This is Raleway',
                style: GoogleFonts.raleway(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
          Text(
            'This is Montserrat',
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'This is Oswald',
            style: GoogleFonts.oswald(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'This is Merriweather',
            style: GoogleFonts.merriweather(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
          'This is Raleway',
          style: GoogleFonts.raleway(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
        'This is Playfair Display',
        style: GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
            ),
            Text(
        'This is Lobster',
        style: GoogleFonts.lobster(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
            ),
            Text(
        'This is Dancing Script',
        style: GoogleFonts.dancingScript(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
            ),
            Text(
        'This is Poppins',
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
            ),
            Text(
        'This is Roboto Slab',
        style: GoogleFonts.robotoSlab(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
            ),
            Text(
        'This is Bebas Neue',
        style: GoogleFonts.bebasNeue(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
            ),
            Text(
        'This is Inconsolata',
        style: GoogleFonts.inconsolata(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
            ),
            Text(
        'This is Zilla Slab',
        style: GoogleFonts.zillaSlab(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
            ),
            Text(
        'This is Source Sans Pro',
        style: GoogleFonts.sourceSans3(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
            ),
            Text(
        'This is Anton',
        style: GoogleFonts.anton(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
            ),
            Text(
        'This is Fira Sans',
        style: GoogleFonts.firaSans(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
            ),
            Text(
        'This is Caveat',
        style: GoogleFonts.caveat(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
            ),
            Text(
        'This is Abel',
        style: GoogleFonts.abel(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
            ),

            Text(
        'This is Nunito',
        style: GoogleFonts.nunito(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
            ),
            Text(
        'This is Ubuntu',
        style: GoogleFonts.ubuntu(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
            ),
            Text(
        'This is Satisfy',
        style: GoogleFonts.satisfy(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
            ),
            Text(
        'This is Satisfy',
        style: GoogleFonts.aBeeZee(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
