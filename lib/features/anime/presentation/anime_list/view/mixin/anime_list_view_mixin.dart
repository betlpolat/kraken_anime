import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/navigation/navigation_manager.dart';

import '../../../../../../core/navigation/navigation_routes.dart';
import '../../../../../../core/state/base/base_state.dart';
import '../../../../data/models/animes.dart';
import '../../view_model/anime_list_view_model.dart';
import '../anime_list_view.dart';

mixin AnimeListViewMixin on BaseState<AnimeListView> {
  late final AnimeListViewModel _animeListViewModel;
  AnimeListViewModel get animeListViewModel => _animeListViewModel;
  final ScrollController scrollController = ScrollController();
  static const channel = MethodChannel('com.example.channel');

  String _channelResponse = '';

  @override
  void initState() {
    super.initState();
    _animeListViewModel = AnimeListViewModel();
    _callMethodChannel();
    animeListViewModel.fetchAnimeList();
  }

  Future<void> _callMethodChannel() async {
    _channelResponse = await channel.invokeMethod('fetchAnimeList');
    print(_channelResponse);
  }

  Future<void> navigateToDetail({required Data? data}) async {
    {
      await NavigationManager.instance.pushToPage<Widget>(
        route: NavigationRoutes.animeDetail,
        arguments: data,
      );
    }
  }

  void getScrollController() {
    if (scrollController.position.atEdge && scrollController.position.pixels != 0) {}
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
