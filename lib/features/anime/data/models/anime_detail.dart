import '../../../../core/utils/constants/model/base_model.dart';

class AnimeDetail with BaseModel<AnimeDetail> {
  List<Data>? data;

  AnimeDetail({
    this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'data': data,
    };
  }

  factory AnimeDetail.fromJson(Map<String, dynamic> json) {
    return AnimeDetail(
      data: (json['data'] as List<dynamic>?)?.map((e) => Data.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  @override
  String toString() => "AnimeDetail(data: $data)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AnimeDetail && runtimeType == other.runtimeType && data == other.data;

  @override
  AnimeDetail fromJson(Map<String, dynamic> json) {
    return AnimeDetail.fromJson(json);
  }
}

class Data {
  Character? character;

  Data({
    this.character,
  });

  Map<String, dynamic> toJson() {
    return {
      'character': character,
    };
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      character: json['character'] == null ? null : Character.fromJson(json['character'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() => "Data(character: $character)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Data && runtimeType == other.runtimeType && character == other.character;
}

class Character {
  int? malId;
  Images? images;
  String? name;

  Character({
    this.malId,
    this.images,
    this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'images': images,
      'name': name,
    };
  }

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      malId: json['mal_id'] as int?,
      images: json['images'] == null ? null : Images.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );
  }

  @override
  String toString() => "Character(malId: $malId,images: $images,name: $name)";

  @override
  int get hashCode => Object.hash(malId, images, name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Character &&
          runtimeType == other.runtimeType &&
          malId == other.malId &&
          images == other.images &&
          name == other.name;
}

class Images {
  Jpg? jpg;
  Webp? webp;

  Images({
    this.jpg,
    this.webp,
  });

  Map<String, dynamic> toJson() {
    return {
      'jpg': jpg,
      'webp': webp,
    };
  }

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      jpg: json['jpg'] == null ? null : Jpg.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: json['webp'] == null ? null : Webp.fromJson(json['webp'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() => "Images(jpg: $jpg,webp: $webp)";

  @override
  int get hashCode => Object.hash(jpg, webp);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Images && runtimeType == other.runtimeType && jpg == other.jpg && webp == other.webp;
}

class Jpg {
  String? imageUrl;

  Jpg({
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
    };
  }

  factory Jpg.fromJson(Map<String, dynamic> json) {
    return Jpg(
      imageUrl: json['image_url'] as String?,
    );
  }

  @override
  String toString() => "Jpg(imageUrl: $imageUrl)";

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Jpg && runtimeType == other.runtimeType && imageUrl == other.imageUrl;
}

class Webp {
  String? imageUrl;
  String? smallImageUrl;

  Webp({
    this.imageUrl,
    this.smallImageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
    };
  }

  factory Webp.fromJson(Map<String, dynamic> json) {
    return Webp(
      imageUrl: json['image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
    );
  }

  @override
  String toString() => "Webp(imageUrl: $imageUrl,smallImageUrl: $smallImageUrl)";

  @override
  int get hashCode => Object.hash(imageUrl, smallImageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Webp &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          smallImageUrl == other.smallImageUrl;
}
