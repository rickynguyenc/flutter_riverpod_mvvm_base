import 'dart:convert';

import 'package:dhy_flutter_app/data/models/location_dto.dart';
import 'package:dhy_flutter_app/domain/entity/character.dart';

class CharactorResponse {
  CharactorResponse({
    this.info,
    this.results,
  });

  final dynamic info;
  final List<CharacterDto>? results;
  // from json
  CharactorResponse.fromJson(Map<String, dynamic> json)
      : info = json['info'],
        results = json['results'] == null
            ? []
            : List<CharacterDto>.from(
                json['results'].map((dynamic x) => CharacterDto.fromMap(x)));
}

class CharacterDto extends Character {
  CharacterDto({
    super.id,
    super.name,
    super.status,
    super.species,
    super.type,
    super.gender,
    super.origin,
    super.location,
    super.image,
    super.episode,
    super.url,
    super.created,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory CharacterDto.fromRawJson(String str) =>
      CharacterDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory CharacterDto.fromMap(Map<String, dynamic> json) => CharacterDto(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin:
            json['origin'] == null ? null : LocationDto.fromMap(json['origin']),
        location: json['location'] == null
            ? null
            : LocationDto.fromMap(json['location']),
        image: json['image'],
        episode: json['episode'] == null
            ? []
            : List<String>.from(json['episode']!.map((dynamic x) => x)),
        url: json['url'],
        created:
            json['created'] == null ? null : DateTime.parse(json['created']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'status': status,
        'species': species,
        'type': type,
        'gender': gender,
        'origin':
            origin != null ? LocationDto.fromLocation(origin!).toMap() : null,
        'location': location != null
            ? LocationDto.fromLocation(location!).toMap()
            : null,
        'image': image,
        'episode': episode == null
            ? [null]
            : List<dynamic>.from(episode!.map((x) => x)),
        'url': url,
        'created': created?.toIso8601String(),
      };
}
