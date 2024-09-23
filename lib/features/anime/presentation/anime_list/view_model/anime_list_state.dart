import 'package:equatable/equatable.dart';

import '../../../data/models/animes.dart';

class AnimeListState extends Equatable {
  final bool onLoad;
  final bool onComplete;
  final List<Data>? animeList;
  final bool onError;
  final String errorMessage;

  AnimeListState({
    this.onLoad = false,
    this.onComplete = false,
    this.animeList,
    this.onError = false,
    this.errorMessage = '',
  });

  List<Object?> get props => [
        onLoad,
        onComplete,
        animeList,
        onError,
        errorMessage,
      ];

  AnimeListState copyWith({
    bool? onLoad,
    bool? onComplete,
    List<Data>? animeList,
    bool? onError,
    String? errorMessage,
  }) {
    return AnimeListState(
      onLoad: onLoad ?? false,
      onComplete: onComplete ?? false,
      animeList: animeList ?? this.animeList,
      onError: onError ?? false,
      errorMessage: errorMessage ?? '',
    );
  }
}
