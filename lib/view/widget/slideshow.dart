import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool? puntosArriba;
  final Color? colorPrimario;
  final Color? colorSecundario;
  final int? bulletPrimario;
  final int? bulletSecundario;

  const Slideshow(
      {Key? key,
      required this.slides,
      this.puntosArriba,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.bulletPrimario = 12,
      this.bulletSecundario = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).primaryColor =
                  colorPrimario!;
              Provider.of<_SlideshowModel>(context).secondColor =
                  colorSecundario!;
              Provider.of<_SlideshowModel>(context).primaryBullet =
                  bulletPrimario!;
              Provider.of<_SlideshowModel>(context).secondBullet =
                  bulletSecundario!;

              return _CreateStructureSlideShow(
                  puntosArriba: puntosArriba, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CreateStructureSlideShow extends StatelessWidget {
  const _CreateStructureSlideShow({
    Key? key,
    required this.puntosArriba,
    required this.slides,
  }) : super(key: key);

  final bool? puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba != null && puntosArriba == true)
          _Dots(
            dots: slides.length,
          ),
        Expanded(child: _Slides(slides: slides)),
        if (puntosArriba == null || puntosArriba == false)
          _Dots(
            dots: slides.length,
          ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int dots;
  const _Dots({
    Key? key,
    required this.dots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            dots,
            (i) => _Dot(
                  index: i,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int size;
    Color color;
    final slideshowmodel = Provider.of<_SlideshowModel>(context);
    if (slideshowmodel.currentPage >= index - 0.5 &&
        slideshowmodel.currentPage <= index + 0.5) {
      size = slideshowmodel.primaryBullet;
      color = slideshowmodel.primaryColor;
    } else {
      size = slideshowmodel.secondBullet;
      color = slideshowmodel.secondColor;
    }
    return AnimatedContainer(
      width: size.toDouble(),
      height: size.toDouble(),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle),
      duration: const Duration(milliseconds: 200),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides({Key? key, required this.slides}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page!;
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
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide({
    Key? key,
    required this.slide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        child: slide);
  }
}

class _SlideshowModel extends ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondColor = Colors.grey;
  int _primaryBullet = 12;
  int _secondBullet = 12;

  double get currentPage => _currentPage;

  set currentPage(double pagina) {
    _currentPage = pagina;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;

  set primaryColor(Color color) {
    _primaryColor = color;
    notifyListeners();
  }

  Color get secondColor => _secondColor;
  set secondColor(Color color) {
    _secondColor = color;
    notifyListeners();
  }

  int get primaryBullet => _primaryBullet;
  set primaryBullet(int size) {
    _primaryBullet = size;
    notifyListeners();
  }

  int get secondBullet => _secondBullet;
  set secondBullet(int size) {
    _secondBullet = size;
    notifyListeners();
  }
}
