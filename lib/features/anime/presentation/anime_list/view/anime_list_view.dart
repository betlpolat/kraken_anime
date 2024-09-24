import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_anime/core/utils/extension/string_extension.dart';
import '../../../../../core/init/language/locale_keys.g.dart';
import '../../../../../core/utils/extension/context_extension.dart';
import '../../../../../core/widget/image/custom_network_image.dart';
import '../../widget/rating_star.dart';
import 'mixin/anime_list_view_mixin.dart';
import '../view_model/anime_list_state.dart';
import '../view_model/anime_list_view_model.dart';

import '../../../../../core/state/base/base_state.dart';

class AnimeListView extends StatefulWidget {
  const AnimeListView({super.key});

  @override
  State<AnimeListView> createState() => _AnimeListViewState();
}

class _AnimeListViewState extends BaseState<AnimeListView> with AnimeListViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => animeListViewModel,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.anime_list_title.locale,
            ),
          ),
          body: _animeList()),
    );
  }

  BlocConsumer<AnimeListViewModel, AnimeListState> _animeList() {
    return BlocConsumer<AnimeListViewModel, AnimeListState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.onLoad) {
          return Center(child: CircularProgressIndicator());
        } else if (state.onComplete) {
          return Padding(
            padding: context.paddingNormal,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24.0,
                  crossAxisSpacing: 24.0,
                ),
                itemCount: state.animeList?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: InkWell(
                          onTap: () async {
                            await navigateToDetail(data: state.animeList?[index]);
                          },
                          child: CustomNetworkImage(
                            path: state.animeList?[index].images?.jpg?.imageUrl ?? '',
                            fit: BoxFit.fitWidth,
                            height: context.width / 2,
                            width: context.width / 2,
                          ),
                        ),
                      ),
                      RatingStar(fieldScore: state.animeList?[index].ratingScore ?? 0),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              state.animeList?[index].title ?? '',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
          );
        } else {
          final error = state.errorMessage;
          return Text(error);
        }
      },
    );
  }
}
