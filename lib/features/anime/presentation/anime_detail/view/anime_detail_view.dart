import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_anime/core/utils/extension/string_extension.dart';
import '../../../../../core/init/language/locale_keys.g.dart';
import '../../../../../core/utils/extension/context_extension.dart';
import '../../../../../core/state/base/base_state.dart';
import '../../../../../core/widget/image/custom_network_image.dart';
import '../../../data/models/animes.dart';
import '../../widget/rating_star.dart';
import '../view_model/anime_detail_state.dart';
import '../view_model/anime_detail_view_model.dart';
import 'mixin/anime_detail_view_mixin.dart';

class AnimeDetailView extends StatefulWidget {
  const AnimeDetailView({super.key, required this.data});
  final Data? data;
  @override
  State<AnimeDetailView> createState() => _AnimeDetailViewState();
}

class _AnimeDetailViewState extends BaseState<AnimeDetailView> with AnimeDetailViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => animeDetailViewModel,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.data?.title ?? ''),
          ),
          body: _animeList()),
    );
  }

  BlocConsumer<AnimeDetailViewModel, AnimeDetailState> _animeList() {
    return BlocConsumer<AnimeDetailViewModel, AnimeDetailState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.onLoad) {
          return Center(child: CircularProgressIndicator());
        } else if (state.onComplete) {
          return Padding(
            padding: context.paddingLow,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CustomNetworkImage(
                        path: widget.data?.images?.jpg?.imageUrl ?? "",
                        fit: BoxFit.fill,
                        height: context.height / 4,
                        width: context.width,
                      ),
                      Positioned(
                        top: context.height / 4 - 40,
                        child: Text(
                          widget.data?.title ?? '',
                          style: context.textTheme.headlineSmall!
                              .copyWith(color: context.colors.background, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  RatingStar(
                    fieldScore: widget.data?.ratingScore ?? 0,
                  ),
                  Row(
                    children: [
                      Text(LocaleKeys.detail_genres.locale,
                          style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
                      Row(children: [
                        for (int index = 0; index < (widget.data?.genres?.length ?? 0); index++)
                          Text(' ' + (widget.data?.genres?[index].name ?? ''))
                      ]),
                    ],
                  ),
                  Row(
                    children: [
                      Text(LocaleKeys.detail_episodes.locale,
                          style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
                      Text(widget.data?.episodes.toString() ?? ''),
                    ],
                  ),
                  Text(widget.data?.synopsis ?? ''),
                  Text(
                    LocaleKeys.detail_characters.locale,
                    style: context.textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: state.characterList?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomNetworkImage(
                              path: state.characterList?[index].character?.images?.jpg?.imageUrl ?? "",
                              height: 120,
                              width: 120,
                            ),
                            SizedBox(
                              width: 120,
                              child: Text(
                                state.characterList?[index].character?.name ?? '',
                                style: context.textTheme.titleMedium,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          final error = state.errorMessage;
          print("error");
          return Text(error);
        }
      },
    );
  }
}
