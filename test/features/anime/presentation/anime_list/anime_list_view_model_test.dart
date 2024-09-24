import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraken_anime/features/anime/presentation/anime_list/view_model/anime_list_state.dart';
import 'package:kraken_anime/features/anime/presentation/anime_list/view_model/anime_list_view_model.dart';

void main() {
  group('Anime List View Model Test', () {
    blocTest<AnimeListViewModel, AnimeListState>('Change Loading Test',
        build: () => AnimeListViewModel(),
        act: (bloc) => bloc.changeLoading(),
        expect: () => {
              isA<AnimeListState>().having((state) => state.onLoad, 'onLoad', true),
            });

    blocTest<AnimeListViewModel, AnimeListState>('Fetch Anime List Test',
        build: () => AnimeListViewModel(),
        act: (bloc) async => bloc.fetchAnimeList(),
        expect: () => {
              isA<AnimeListState>().having((state) => state.onLoad, 'onLoad', true),
              isA<AnimeListState>()
                  .having((state) => state.onComplete, 'onComplete', true)
                  .having((state) => state.onLoad, 'onLoad', false)
                  .having((state) => state.animeList, 'animeList', isNotEmpty)
            });
  });
}
