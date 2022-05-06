import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/slider_model.dart';

class Slideshow extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
  create: (_) => SliderModel(),
      
    );
  }
}