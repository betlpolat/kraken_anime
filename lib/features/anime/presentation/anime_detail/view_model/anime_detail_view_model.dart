import 'package:dio/dio.dart';
import '../../../../../core/service/manager/base_network_manager.dart';
import '../../../../../core/state/base/base_cubit.dart';
import '../../../../../core/utils/constants/enum/http_types.dart';
import '../../../data/models/anime_detail.dart';
import 'anime_detail_state.dart';

class AnimeDetailViewModel extends BaseCubit<AnimeDetailState> {
  AnimeDetailViewModel() : super(AnimeDetailState());
  final dio = Dio();

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(onLoad: !state.onLoad));
  }

  ///Fetch Anime detail List
  Future<void> fetchAnimeDetail(int id) async {
    print(state.onLoad);
    changeLoading();
    print(state.onLoad);

    final response = await NetworkManager.instance!.coreDio!
        .send<AnimeDetail, AnimeDetail>('anime/$id/characters', type: HttpTypes.GET, parseModel: AnimeDetail());

    emit(
      state.copyWith(onComplete: true, onLoad: false, characterList: response.data?.data),
    );
  }
}
