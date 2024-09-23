import '../anime_detail_view.dart';

import '../../../../../../core/state/base/base_state.dart';
import '../../view_model/anime_detail_view_model.dart';

mixin AnimeDetailViewMixin on BaseState<AnimeDetailView> {
  late final AnimeDetailViewModel _animeDetailViewModel;
  AnimeDetailViewModel get animeDetailViewModel => _animeDetailViewModel;
  @override
  void initState() {
    super.initState();
    _animeDetailViewModel = AnimeDetailViewModel();

    animeDetailViewModel.fetchAnimeDetail(widget.data?.malId ?? 0);
  }
}
