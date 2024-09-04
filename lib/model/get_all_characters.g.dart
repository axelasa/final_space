// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCharacters _$GetAllCharactersFromJson(Map<String, dynamic> json) =>
    GetAllCharacters(
      id: (json['id'] as num?)?.toDouble(),
      name: json['name'] as String?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      gender: json['gender'] as String?,
      hair: json['hair'] as String?,
      alias:
          (json['alias'] as List<dynamic>?)?.map((e) => e as String).toList(),
      origin: json['origin'] as String?,
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imgUrl: json['img_url'] as String?,
    );

Map<String, dynamic> _$GetAllCharactersToJson(GetAllCharacters instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'gender': instance.gender,
      'hair': instance.hair,
      'alias': instance.alias,
      'origin': instance.origin,
      'abilities': instance.abilities,
      'img_url': instance.imgUrl,
    };

GetAllEpisodes _$GetAllEpisodesFromJson(Map<String, dynamic> json) =>
    GetAllEpisodes(
      id: (json['id'] as num?)?.toDouble(),
      name: json['name'] as String?,
      airDate: json['air_date'] as String?,
      director: json['director'] as String?,
      writer: json['writer'] as String?,
      characters: (json['characters'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imgUrl: json['img_url'] as String?,
    );

Map<String, dynamic> _$GetAllEpisodesToJson(GetAllEpisodes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.airDate,
      'director': instance.director,
      'writer': instance.writer,
      'characters': instance.characters,
      'img_url': instance.imgUrl,
    };

GetAllLocations _$GetAllLocationsFromJson(Map<String, dynamic> json) =>
    GetAllLocations(
      id: (json['id'] as num?)?.toDouble(),
      name: json['name'] as String?,
      type: json['type'] as String?,
      inhabitants: (json['inhabitants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      notableResidents: (json['notable_residents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imgUrl: json['img_url'] as String?,
    );

Map<String, dynamic> _$GetAllLocationsToJson(GetAllLocations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'inhabitants': instance.inhabitants,
      'notable_residents': instance.notableResidents,
      'img_url': instance.imgUrl,
    };

GetAllQuotes _$GetAllQuotesFromJson(Map<String, dynamic> json) => GetAllQuotes(
      id: (json['id'] as num?)?.toDouble(),
      quote: json['quote'] as String?,
      by: json['by'] as String?,
      character: json['character'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$GetAllQuotesToJson(GetAllQuotes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quote': instance.quote,
      'by': instance.by,
      'character': instance.character,
      'image': instance.image,
    };
