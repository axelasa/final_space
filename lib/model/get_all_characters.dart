import 'package:json_annotation/json_annotation.dart'; 

part 'get_all_characters.g.dart';

@JsonSerializable()
class GetAllCharacters {
  @JsonKey(name: 'id')
  final  double? id;
  @JsonKey(name: 'name')
  final  String? name;
  @JsonKey(name: 'status')
  final  String? status;
  @JsonKey(name: 'species')
  final  String? species;
  @JsonKey(name: 'gender')
  final  String? gender;
  @JsonKey(name: 'hair')
  final  String? hair;
  @JsonKey(name: 'alias')
  final  List<String>? alias;
  @JsonKey(name: 'origin')
  final  String? origin;
  @JsonKey(name: 'abilities')
  final  List<String>? abilities;
  @JsonKey(name: 'img_url')
  final  String? imgUrl;

  GetAllCharacters({this.id, this.name, this.status, this.species, this.gender, this.hair, this.alias, this.origin, this.abilities, this.imgUrl});

   factory GetAllCharacters.fromJson(Map<String, dynamic> json) => _$GetAllCharactersFromJson(json);

   Map<String, dynamic> toJson() => _$GetAllCharactersToJson(this);
}

@JsonSerializable()
class GetAllEpisodes {
  @JsonKey(name: 'id')
  final  double? id;
  @JsonKey(name: 'name')
  final  String? name;
  @JsonKey(name: 'air_date')
  final  String? airDate;
  @JsonKey(name: 'director')
  final  String? director;
  @JsonKey(name: 'writer')
  final  String? writer;
  @JsonKey(name: 'characters')
  final  List<String>? characters;
  @JsonKey(name: 'img_url')
  final  String? imgUrl;

  GetAllEpisodes({this.id, this.name, this.airDate, this.director, this.writer, this.characters, this.imgUrl});

  factory GetAllEpisodes.fromJson(Map<String, dynamic> json) => _$GetAllEpisodesFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllEpisodesToJson(this);
}


@JsonSerializable(ignoreUnannotated: false)
class GetAllLocations {
  @JsonKey(name: 'id')
  final  double? id;
  @JsonKey(name: 'name')
  final  String? name;
  @JsonKey(name: 'type')
  final  String? type;
  @JsonKey(name: 'inhabitants')
  final  List<String>? inhabitants;
  @JsonKey(name: 'notable_residents')
  final  List<String>? notableResidents;
  @JsonKey(name: 'img_url')
  final  String? imgUrl;

  GetAllLocations({this.id, this.name, this.type, this.inhabitants, this.notableResidents, this.imgUrl});

  factory GetAllLocations.fromJson(Map<String, dynamic> json) => _$GetAllLocationsFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllLocationsToJson(this);
}


@JsonSerializable(ignoreUnannotated: false)
class GetAllQuotes {
  @JsonKey(name: 'id')
  final  double? id;
  @JsonKey(name: 'quote')
  final  String? quote;
  @JsonKey(name: 'by')
  final  String? by;
  @JsonKey(name: 'character')
  final  String? character;
  @JsonKey(name: 'image')
  final  String? image;

  GetAllQuotes({this.id, this.quote, this.by, this.character, this.image});

  factory GetAllQuotes.fromJson(Map<String, dynamic> json) => _$GetAllQuotesFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllQuotesToJson(this);
}

