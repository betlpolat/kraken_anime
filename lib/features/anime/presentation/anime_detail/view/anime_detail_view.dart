import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/extension/context_extension.dart';
import '../../../../../core/state/base/base_state.dart';
import '../../../../../core/widget/image/fill_image_with_color.dart';
import '../../../data/models/animes.dart';
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.data?.images?.jpg?.imageUrl ?? "",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                  height: 200,
                  width: context.width,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return const SizedBox.shrink();
                  },
                ),
              ),
              FieldScoreStars(fieldScore: widget.data?.ratingScore ?? 0),
              Text(
                widget.data?.score?.toString() ?? '',
              ),
              Text(widget.data?.synopsis ?? ''),
              Text(state.characterList?[0].character?.name ?? ''),
            ],
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

class FieldScoreStars extends StatelessWidget {
  const FieldScoreStars({super.key, required this.fieldScore});
  final double fieldScore;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < fieldScore.toInt(); i++)
          FillImageWithColor(
            imageUrl: "assets/icons/star_inactive.svg",
            fillColor: context.theme.colorScheme.tertiary,
            percentage: 100,
          ),
        if ((fieldScore - fieldScore.toInt()) > 0)
          FillImageWithColor(
            imageUrl: "assets/icons/star_inactive.svg",
            fillColor: context.theme.colorScheme.tertiary,
            percentage: ((fieldScore - fieldScore.toInt()) * 100).toInt(),
          ),
        for (int i = 0; i < (5 - fieldScore).toInt(); i++)
          FillImageWithColor(
            imageUrl: "assets/icons/star_inactive.svg",
            fillColor: context.theme.colorScheme.tertiary,
            percentage: 0,
          ),
        Text(fieldScore.toStringAsFixed(1))
      ],
    );
  }
}
