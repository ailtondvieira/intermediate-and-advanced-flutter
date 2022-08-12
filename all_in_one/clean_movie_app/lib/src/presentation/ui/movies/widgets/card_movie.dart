import 'package:flutter/material.dart';

import '../../../../../shared/utils/format_date.dart';
import '../../../../domain/entities/movie_entity.dart';

class CardMovie extends StatelessWidget {
  final MovieEntity movie;
  const CardMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network('https://image.tmdb.org/t/p/w400/${movie.posterPath}'),
            ),
            Positioned(
              left: 15,
              bottom: -20,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black87,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0.0, end: movie.voteAverage / 10),
                      duration: const Duration(seconds: 3),
                      builder: (context, double valueA, child) {
                        return CircularProgressIndicator(value: valueA);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text((movie.voteAverage * 10).toStringAsFixed(0)),
                        const Text('%', style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(formatDate(movie.releaseDate)),
            ],
          ),
        )
      ],
    );
  }
}
