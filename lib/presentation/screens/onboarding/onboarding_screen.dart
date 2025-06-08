import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
    this.title,
    this.caption,
    this.imageUrl,
  );
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Cillum labore nulla proident anim pariatur.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Culpa laboris dolore sunt eu sunt veniam aliquip eiusmod excepteur mollit aute dolore qui adipisicing.',
      'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Cillum minim cillum dolore dolor aute.',
      'assets/images/3.png')
];

class OnboardingScreen extends StatefulWidget {
  static const name = 'onboarding_screen';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // se crea un controlador para obtener el comportamiendo del widget
  final PageController pageviewController = PageController();
  bool endReached = false;

// Con este manejas el estado de un widget (cuando se monta el widgets)
  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ??
          0; // por si no se tiene la referencia aun, se deja en 0
      if (!endReached && page >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      } else if (endReached && page <= slides.length - 1.5) {
        setState(() {
          endReached = false;
        });
      }
    });
  }

  // si usamos un listener o un controllador, siempre es bueno llamar a un dispose para no gaastar mas memorias
  @override
  void dispose() {
    // llamamos el dispose del controllador
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: BouncingScrollPhysics(),
            children: slides
                .map(
                  (sliceData) => _Slide(
                    title: sliceData.title,
                    caption: sliceData.caption,
                    imageUrl: sliceData.imageUrl,
                  ),
                )
                .toList(),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => context.pop(),
              child: Text('Salir'),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 50,
                  left: 20, // Márgen izquierdo
                  right: 20, // Márgen derecho
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 400),
                    child: GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        height: 60,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Comenzar",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : FadeInRight(
                  from: 0,
                  delay: const Duration(
                    milliseconds: 400,
                  ),
                  child: SizedBox(),
                )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(
                imageUrl,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
