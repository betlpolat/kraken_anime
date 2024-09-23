import '../../../../core/utils/constants/model/base_model.dart';

class Animes extends BaseModel<Animes> {
  Pagination? pagination;
  List<Data>? data;

  Animes({
    this.pagination,
    this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination,
      'data': data,
    };
  }

  factory Animes.fromJson(Map<String, dynamic> json) {
    return Animes(
      pagination: json['pagination'] == null ? null : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)?.map((e) => Data.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  @override
  String toString() => "Response(pagination: $pagination,data: $data)";

  @override
  int get hashCode => Object.hash(pagination, data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Animes && runtimeType == other.runtimeType && pagination == other.pagination && data == other.data;

  @override
  fromJson(Map<String, dynamic> json) {
    return Animes.fromJson(json);
  }
}

class Pagination {
  int? lastVisiblePage;
  bool? hasNextPage;
  int? currentPage;
  Items? items;

  Pagination({
    this.lastVisiblePage,
    this.hasNextPage,
    this.currentPage,
    this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'last_visible_page': lastVisiblePage,
      'has_next_page': hasNextPage,
      'current_page': currentPage,
      'items': items,
    };
  }

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      lastVisiblePage: json['last_visible_page'] as int?,
      hasNextPage: json['has_next_page'] as bool?,
      currentPage: json['current_page'] as int?,
      items: json['items'] == null ? null : Items.fromJson(json['items'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() =>
      "Pagination(lastVisiblePage: $lastVisiblePage,hasNextPage: $hasNextPage,currentPage: $currentPage,items: $items)";

  @override
  int get hashCode => Object.hash(lastVisiblePage, hasNextPage, currentPage, items);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pagination &&
          runtimeType == other.runtimeType &&
          lastVisiblePage == other.lastVisiblePage &&
          hasNextPage == other.hasNextPage &&
          currentPage == other.currentPage &&
          items == other.items;
}

class Items {
  int? count;
  int? total;
  int? perPage;

  Items({
    this.count,
    this.total,
    this.perPage,
  });

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'total': total,
      'per_page': perPage,
    };
  }

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      count: json['count'] as int?,
      total: json['total'] as int?,
      perPage: json['per_page'] as int?,
    );
  }

  @override
  String toString() => "Items(count: $count,total: $total,perPage: $perPage)";

  @override
  int get hashCode => Object.hash(count, total, perPage);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Items &&
          runtimeType == other.runtimeType &&
          count == other.count &&
          total == other.total &&
          perPage == other.perPage;
}

class Data {
  int? malId;
  Images? images;
  String? title;
  String? type;
  int? episodes;
  num? score;
  String? synopsis;
  List<Genres>? genres;

  Data({
    this.malId,
    this.images,
    this.title,
    this.type,
    this.episodes,
    this.score,
    this.synopsis,
    this.genres,
  });
  double? get ratingScore => (score ?? 0) / 2;

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'images': images,
      'title': title,
      'type': type,
      'episodes': episodes,
      'score': score,
      'synopsis': synopsis,
      'genres': genres,
    };
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      malId: json['mal_id'] as int?,
      images: json['images'] == null ? null : Images.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String?,
      type: json['type'] as String?,
      episodes: json['episodes'] as int?,
      score: json['score'] as num?,
      synopsis: json['synopsis'] as String?,
      genres: (json['genres'] as List<dynamic>?)?.map((e) => Genres.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  @override
  String toString() =>
      "Data(malId: $malId,images: $images,title: $title,type: $type,episodes: $episodes,score: $score,synopsis: $synopsis,genres: $genres)";

  @override
  int get hashCode => Object.hash(malId, images, title, type, episodes, score, synopsis, genres);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Data &&
          runtimeType == other.runtimeType &&
          malId == other.malId &&
          images == other.images &&
          title == other.title &&
          type == other.type &&
          episodes == other.episodes &&
          score == other.score &&
          synopsis == other.synopsis &&
          genres == other.genres;
}

class Images {
  Jpg? jpg;

  Images({
    this.jpg,
  });

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg,
    };
  }

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      jpg: json['jpg'] == null ? null : Jpg.fromJson(json['jpg'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() => "Images(jpg: $jpg)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Images && runtimeType == other.runtimeType && jpg == other.jpg;
}

class Jpg {
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  Jpg({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'large_image_url': largeImageUrl,
    };
  }

  factory Jpg.fromJson(Map<String, dynamic> json) {
    return Jpg(
      imageUrl: json['image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
    );
  }

  @override
  String toString() => "Jpg(imageUrl: $imageUrl,smallImageUrl: $smallImageUrl,largeImageUrl: $largeImageUrl)";

  @override
  int get hashCode => Object.hash(imageUrl, smallImageUrl, largeImageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Jpg &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          smallImageUrl == other.smallImageUrl &&
          largeImageUrl == other.largeImageUrl;
}

class Genres {
  int? malId;
  String? type;
  String? name;
  String? url;

  Genres({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'type': type,
      'name': name,
      'url': url,
    };
  }

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      malId: json['mal_id'] as int?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  @override
  String toString() => "Genres(malId: $malId,type: $type,name: $name,url: $url)";

  @override
  int get hashCode => Object.hash(malId, type, name, url);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Genres &&
          runtimeType == other.runtimeType &&
          malId == other.malId &&
          type == other.type &&
          name == other.name &&
          url == other.url;
}
