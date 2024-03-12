import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const name = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    if (nowPlayingMovies.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Material(
      child: ListView.builder(
        itemCount: nowPlayingMovies.length,
        itemBuilder: (context, index) {
          final movie = nowPlayingMovies[index];
          return ListTile(
            title: Text(movie.title),
          );
        },
      ),
    );
  }
}
