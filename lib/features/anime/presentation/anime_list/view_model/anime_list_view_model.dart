import '../../../data/service/anime_list_service.dart';
import 'anime_list_state.dart';
import '../../../../../core/state/base/base_cubit.dart';

class AnimeListViewModel extends BaseCubit<AnimeListState> {
  AnimeListViewModel() : super(AnimeListState());

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(onLoad: !state.onLoad));
  }

  ///Fetch Anime List
  Future<void> fetchAnimeList() async {
    changeLoading();
    final response = await AnimeListService().fetchAnimeList();

    emit(
      state.copyWith(onComplete: true, onLoad: false, animeList: response),
    );
  }
}
