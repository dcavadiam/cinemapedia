import '../../domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/the_moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_640.png',
      character: cast.character);
}
