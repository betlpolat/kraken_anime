import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraken_anime/features/anime/presentation/anime_detail/view_model/anime_detail_state.dart';
import 'package:kraken_anime/features/anime/presentation/anime_detail/view_model/anime_detail_view_model.dart';

void main() {
  group('Anime Detail View Model Test', () {
    blocTest<AnimeDetailViewModel, AnimeDetailState>('Change Loading Test',
        build: () => AnimeDetailViewModel(),
        act: (bloc) => bloc.changeLoading(),
        expect: () => {
              isA<AnimeDetailState>().having((state) => state.onLoad, 'onLoad', true),
            });

    blocTest<AnimeDetailViewModel, AnimeDetailState>('Fetch Anime Detail Test',
        build: () => AnimeDetailViewModel(),
        act: (bloc) async => bloc.fetchAnimeDetail(1000),
        expect: () => {
              isA<AnimeDetailState>().having((state) => state.onLoad, 'onLoad', true),
              isA<AnimeDetailState>()
                  .having((state) => state.onComplete, 'onComplete', true)
                  .having((state) => state.onLoad, 'onLoad', false)
                  .having((state) => state.characterList, 'characterList', isNotEmpty)
            });
  });
}
