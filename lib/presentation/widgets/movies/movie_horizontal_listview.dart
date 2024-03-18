import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieHorizontalListview extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview(
      {super.key,
      required this.movies,
      this.title,
      this.subtitle,
      this.loadNextPage});

  @override
  State<MovieHorizontalListview> createState() =>
      _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {
  final scrollControler = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollControler.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollControler.position.pixels + 200) >=
          scrollControler.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subtitle != null)
            _Title(
              title: widget.title,
              subtitle: widget.subtitle,
            ),
          Expanded(
              child: ListView.builder(
            controller: scrollControler,
            itemCount: widget.movies.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeInRight(
                child: _Slide(
                  movie: widget.movies[index],
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: 150,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () => context.push('/movie/${movie.id}'),
                    child: FadeIn(child: child),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 5),
          //* Title
          SizedBox(
              width: 150,
              child: Text(
                movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStyles.titleSmall,
              )),

          //* Rating
          Row(
            children: [
              const Icon(Icons.star, size: 15, color: Colors.amber),
              const SizedBox(width: 5),
              Text(movie.voteAverage.toString(),
                  style: textStyles.bodyMedium?.copyWith(
                    color: Colors.amber,
                  )),
              const SizedBox(width: 10),
              const Icon(
                Icons.favorite,
                size: 15,
                color: Colors.red,
              ),
              const SizedBox(width: 3),
              // Text(movie.popularity.toString(),
              //     style: textStyles.bodyMedium?.copyWith(color: Colors.red)),
              Text(HumanFormats.formatNumber(movie.popularity),
                  style: textStyles.bodyMedium?.copyWith(color: Colors.red)),
            ],
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
        padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            if (title != null) Text(title!, style: titleStyle),
            const Spacer(),
            if (subtitle != null)
              FilledButton.tonal(
                style: const ButtonStyle(
                  visualDensity: VisualDensity.compact,
                ),
                onPressed: () {},
                child: Text(subtitle!),
              )
          ],
        ));
  }
}
