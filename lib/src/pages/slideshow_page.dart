import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../themes/themes.dart';
import '../widgets/slideShow.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isLarge;
    if(MediaQuery.of(context).size.height > 500){
      isLarge= true;
    }else{
      isLarge= false;
    }

    final children = [
        Expanded(child: MiSlideShow()),
        Expanded(child: MiSlideShow()),
      ];

    return Scaffold(
        // backgroundColor: Colors.indigo,
        body: isLarge ? Column(
          children: children,
        ): Row(children:children
    ));
  }
}

class MiSlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;
    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 12,
      // puntosArriba: false,
      colorPrimario: appTheme.darkTheme? accentColor: const Color(0xffFF5A7E),
      //colorSecundario: Colors.blue.shade50,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg')
      ],
    );
  }
}
