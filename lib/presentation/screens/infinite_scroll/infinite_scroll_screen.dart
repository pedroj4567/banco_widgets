import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinity_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;

  // para chequear si esta montado el componenete

  bool isMounted = true;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      // posicion actual con el position.pixels
      // scrollController.position.pixels;

      // ultima posicion  con el maxScrollExtent.maxScrollExtent
      // scrollController.position.maxScrollExtent;

      // El 500 es para que tome la mitad del elemento

      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // cargamos la siguiente pagina
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  void addFiveIds() {
    final lastId = imagesIds.last;

    // Agregamos 5 elementos mas al array.

    // lo que hace es sumar cada elemento que esta actualmente y le suma el elemento actual de la lisa
    // ej: 5 + 1 = 6 y asi con todo
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  // creamos un metodo asincrono para cargar la pagina

  Future loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(
      const Duration(seconds: 2),
    );

    addFiveIds();
    isLoading = false;

    if (!mounted) return;
    setState(() {});

    //TODO: Mover scroll hacia abajo
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) {
      return;
    }

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  // implementacion del metodo para el refresh

  Future<void> onRefresh() async {
    isLoading = true;

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    isLoading = false;

    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveIds();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text('Infinite Scroll'),
      // ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 3,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return _Image(
                imagesIds: imagesIds,
                index: index,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => isLoading ? null : context.pop(),
        // child: ,
        child: isLoading
            ? SpinPerfect(
                infinite: true,
                child: Icon(Icons.refresh),
              )
            : FadeIn(
                child: Icon(Icons.arrow_back),
              ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    super.key,
    required this.imagesIds,
    required this.index,
  });

  final List<int> imagesIds;
  final int index;
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fit: BoxFit.cover,
      width: double.infinity,
      height: 300,
      placeholder: AssetImage('assets/images/jar-loading.gif'),
      image:
          NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
    );
  }
}
