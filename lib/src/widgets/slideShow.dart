import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import '../models/slider_model.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  // ignore: use_key_in_widget_constructors
  const Slideshow(
      { @required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _SliderShowModel(),
        child: SafeArea(
          child: Center(
            child: Builder(
              builder: (BuildContext context) {
                Provider.of<_SliderShowModel>(context).colorPrimario =
                    colorPrimario;
                Provider.of<_SliderShowModel>(context).colorSecundario =
                    colorSecundario;

                return _CrearEstructuraSlideShow(
                    puntosArriba: puntosArriba, slides: slides);
              },
            ),
          ),
        ));
  }
}

class _CrearEstructuraSlideShow extends StatelessWidget {
  const _CrearEstructuraSlideShow({
    
     this.puntosArriba,
     this.slides,
  });

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba)
          _Dots(
            slides.length,
          ),
        Expanded(child: _Slides(slides)),
        if (!puntosArriba)
          _Dots(
            slides.length,
          ),
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      print('Pagina actual:  ${pageViewController.page}');
      //Actualizar la instanacia de mi clase o provider (sliderModel)
      Provider.of<_SliderShowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        // children:
        // const [
        //   _Slide('assets/svgs/slide-1.svg'),
        //   _Slide('assets/svgs/slide-2.svg'),
        //   _Slide('assets/svgs/slide-3.svg'),
        // ],
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  // final Color colorPrimario;
  // final Color colorSecundario;

  const _Dots(
    this.totalSlides,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: const [
        //   _Dot(0),
        //   _Dot(1),
        //   _Dot(2),
        // ],
        children: List.generate(
          this.totalSlides,
          (i) => _Dot(i),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  // final Color colorPrimario;
  // final Color colorSecundario;
  const _Dot(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    //final pageViewIndex = Provider.of<_SliderShowModel>(context).currentPage;
    final sShowModel = Provider.of<_SliderShowModel>(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (sShowModel.currentPage >= index - 0.5 &&
                sShowModel.currentPage < index + 0.5)
            ? sShowModel.colorPrimario
            : sShowModel.colorSecundario,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  // final String svg;
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SliderShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;

  double get currentPage => this._currentPage;

  set currentPage(double pagina) {
    this._currentPage = pagina;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario(Color color) {
    this._colorPrimario = color;
    notifyListeners();
  }

  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color color) {
    this._colorSecundario = color;
    notifyListeners();
  }
}
