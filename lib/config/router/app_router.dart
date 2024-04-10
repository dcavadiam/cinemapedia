import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/home/categories_view.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  // IMPLEMENTACIÓN OFICIAL DE GOROUTER EN EL CUSTOM BOTTOM NAV (GUARDA EL ESTADO DE LAS VISTAS)

  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) =>
        HomeScreen(childView: navigationShell),
    branches: [
      StatefulShellBranch(routes: <RouteBase>[
        GoRoute(
            path: "/",
            builder: (context, state) {
              return const HomeView();
            },
            routes: [
              GoRoute(
                path: 'movie/:id',
                name: MovieScreen.name,
                builder: (context, state) {
                  final movieID = state.pathParameters['id'] ?? 'no-id';
                  return MovieScreen(movieId: movieID);
                },
              ),
            ]),
      ]),
      StatefulShellBranch(routes: <RouteBase>[
        GoRoute(
          path: "/favorites",
          builder: (context, state) {
            return const FavoritesView();
          },
        ),
      ]),
      StatefulShellBranch(routes: <RouteBase>[
        GoRoute(
          path: "/categories",
          builder: (context, state) {
            return const CategoriesView();
          },
        ),
      ]),
    ],
  )

  // IMPLEMENTACIÓN OFICIAL DE GOROUTER EN EL CUSTOM BOTTOM NAV (NO GUARDA EL ESTADO DE LAS VISTAS)

  // ShellRoute(
  //   builder: (context, state, child) {
  //     return HomeScreen(childView: child);
  //   },
  //   routes: [
  //     GoRoute(
  //         path: "/",
  //         builder: (context, state) {
  //           return const HomeView();
  //         },
  //         routes: [
  //           GoRoute(
  //             path: 'movie/:id',
  //             name: MovieScreen.name,
  //             builder: (context, state) {
  //               final movieID = state.pathParameters['id'] ?? 'no-id';
  //               return MovieScreen(movieId: movieID);
  //             },
  //           ),
  //         ]),
  //     GoRoute(
  //       path: "/favorites",
  //       builder: (context, state) {
  //         return const FavoritesView();
  //       },
  //     ),
  //   ],
  // ),

  //RUTAS PADRE/HIJO

  // GoRoute(
  //     path: '/',
  //     name: HomeScreen.name,
  //     builder: (context, state) => const HomeScreen(
  //           childView: HomeView(),
  //         ),
  //     routes: [
  //       GoRoute(
  //         path: 'movie/:id',
  //         name: MovieScreen.name,
  //         builder: (context, state) {
  //           final movieID = state.pathParameters['id'] ?? 'no-id';
  //           return MovieScreen(movieId: movieID);
  //         },
  //       ),
  //     ]),
]);
