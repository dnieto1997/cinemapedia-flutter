import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorByNotifier, Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch(ActorsRepositoryProvider);
  return ActorByNotifier(getActors: actorsRepository.getActorsByMovie);
});

typedef GetActorCallback = Future<List<Actor>> Function(String movieId);

class ActorByNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorCallback getActors;
  ActorByNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
