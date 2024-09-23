import 'dart:async';

import 'package:flutter/services.dart';

import '../../../../core/service/manager/base_network_manager.dart';
import '../../../../core/utils/constants/enum/http_types.dart';
import '../models/animes.dart';

class AnimeListService {
  static const channel = MethodChannel("flutter_channel");
  static StreamController<String> _controller = StreamController.broadcast();

  static Stream get streamData => _controller.stream;

  Future<List<Data>?> fetchAnimeList() async {
    final response = await NetworkManager.instance!.coreDio!
        .send<Animes, Animes>('top/anime', type: HttpTypes.GET, parseModel: Animes());
    return response.data?.data;

    //   try {
    //     channel.setMethodCallHandler((call) async {
    //       print("*************");

    //       switch (call.method) {
    //         case "getAnimeList":
    //           _controller.add("");

    //           print("*************");

    //           final response = await NetworkManager.instance!.coreDio!
    //               .send<Animes, Animes>('top/anime', type: HttpTypes.GET, parseModel: Animes());
    //           return response.data?.data;
    //       }
    //     });
    //     final _methodChannel = await channel.invokeMethod("fetchAnimeList");
    //   } on PlatformException {
    //     return null;
    //   }
    //   return null;
  }
}
