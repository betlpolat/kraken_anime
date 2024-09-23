import 'package:equatable/equatable.dart';

import '../../../data/models/anime_detail.dart';

class AnimeDetailState extends Equatable {
  final bool onLoad;
  final bool onComplete;
  final List<Data>? characterList;
  final bool onError;
  final String errorMessage;

  AnimeDetailState({
    this.onLoad = false,
    this.onComplete = false,
    this.characterList,
    this.onError = false,
    this.errorMessage = '',
  });

  List<Object?> get props => [
        onLoad,
        onComplete,
        characterList,
        onError,
        errorMessage,
      ];

  AnimeDetailState copyWith({
    bool? onLoad,
    bool? onComplete,
    List<Data>? characterList,
    bool? onError,
    String? errorMessage,
  }) {
    return AnimeDetailState(
      onLoad: onLoad ?? false,
      onComplete: onComplete ?? false,
      characterList: characterList ?? this.characterList,
      onError: onError ?? false,
      errorMessage: errorMessage ?? '',
    );
  }
}
