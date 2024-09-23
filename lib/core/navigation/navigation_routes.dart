import 'package:flutter/material.dart';

import '../../features/anime/data/models/animes.dart';
import '../../features/anime/presentation/anime_detail/view/anime_detail_view.dart';
import '../../features/anime/presentation/anime_list/view/anime_list_view.dart';

mixin NavigationRoutesMixin<T> on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if ((routeSettings.name?.isEmpty ?? true) || (routeSettings.name == '/')) {
      return _navigateToNormal(
        const AnimeListView(),
      );
    }

    final routes = NavigationRoutes.values.byName(routeSettings.name!.substring(1));

    switch (routes) {
      case NavigationRoutes.animeList:
        return _navigateToNormal(const AnimeListView());
      case NavigationRoutes.animeDetail:
        final data = routeSettings.arguments;
        return _navigateToNormal(
          AnimeDetailView(data: data is Data ? data : null),
        );
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }
}

enum NavigationRoutes { animeList, animeDetail }

extension NavigatorRoutesExtension on NavigationRoutes {
  String get withSlash => '/$name';
}
