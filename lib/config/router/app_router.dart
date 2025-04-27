import 'package:go_router/go_router.dart';
import 'package:widget_application/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      name: CardScreen.name,
      path: '/cards',
      builder: (context, state) => CardScreen(),
    ),
    GoRoute(
      name: ProgressScreen.name,
      path: '/progress',
      builder: (context, state) => ProgressScreen(),
    ),
    GoRoute(
      name: SnackbarScreen.name,
      path: '/snackbar',
      builder: (context, state) => SnackbarScreen(),
    ),
    GoRoute(
      name: AnimatedScreen.name,
      path: '/animates',
      builder: (context, state) => AnimatedScreen(),
    ),
  ],
);
