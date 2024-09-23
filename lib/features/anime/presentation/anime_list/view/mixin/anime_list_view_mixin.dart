import 'package:flutter/material.dart';
import '../../../../../../core/navigation/navigation_manager.dart';

import '../../../../../../core/navigation/navigation_routes.dart';
import '../../../../../../core/state/base/base_state.dart';
import '../../../../data/models/animes.dart';
import '../../view_model/anime_list_view_model.dart';
import '../anime_list_view.dart';

mixin AnimeListViewMixin on BaseState<AnimeListView> {
  late final AnimeListViewModel _animeListViewModel;
  AnimeListViewModel get animeListViewModel => _animeListViewModel;
  @override
  void initState() {
    super.initState();
    _animeListViewModel = AnimeListViewModel();

    animeListViewModel.fetchAnimeList();
  }

  Future<void> navigateToDetail({required Data? data}) async {
    {
      await NavigationManager.instance.pushToPage<Widget>(
        route: NavigationRoutes.animeDetail,
        arguments: data,
      );
    }
  }
}
