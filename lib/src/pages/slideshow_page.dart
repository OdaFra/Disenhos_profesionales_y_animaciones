import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [Expanded(child: _Slides(),),
        _Dots()
        ],
      )),
    );
  }
}

// SvgPicture.asset('assets/svgs/slide-5.svg')

class _Slides extends StatelessWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: const [
          _Slide('assets/svgs/slide-1.svg'),
          _Slide('assets/svgs/slide-2.svg'),
          _Slide('assets/svgs/slide-3.svg'),
        ],
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Dot(),
          _Dot(),
          _Dot()
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: const  BoxDecoration(color: Colors.grey, shape: BoxShape.circle)
    
    );
  }
}


class _Slide extends StatelessWidget {
  final String svg;

  const _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
