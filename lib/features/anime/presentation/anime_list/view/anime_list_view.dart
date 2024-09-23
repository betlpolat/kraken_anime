import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/extension/context_extension.dart';
import 'mixin/anime_list_view_mixin.dart';
import '../view_model/anime_list_state.dart';
import '../view_model/anime_list_view_model.dart';

import '../../../../../core/state/base/base_state.dart';
import '../../../../../core/widget/image/fill_image_with_color.dart';

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
            title: Text('ANIMES'),
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
                          child: ClipRRect(
                            borderRadius: context.normalBorderRadius,
                            child: Image.network(
                              state.animeList?[index].images?.jpg?.imageUrl ?? '',
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fitWidth,
                              height: context.width / 2,
                              width: context.width / 2,
                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                print(state.animeList?[index].images?.jpg);
                                return const SizedBox.shrink();
                              },
                            ),
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

class RatingStar extends StatelessWidget {
  const RatingStar({
    super.key,
    required this.fieldScore,
  });

  final double fieldScore;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FillImageWithColor(
          imageUrl: "assets/icons/star_inactive.svg",
          fillColor: context.theme.colorScheme.tertiary,
          percentage: (fieldScore == 0 ? 5 : fieldScore.toInt()) * 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text(
            fieldScore == 0 ? "5" : fieldScore.toStringAsFixed(1),
          ),
        ),
      ],
    );
  }
}
