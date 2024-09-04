
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:final_space/model/get_all_characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../constats/base_url.dart';


@injectable
class ApiService{
  var dio = Dio();

  Future<List<GetAllCharacters?>>getAllCharacters()async{
    try{
     var response = await dio.request("$url/$character",
       options: Options(
         method: 'GET',
       ),
     );

     if(response.statusCode == 200) {

       List<dynamic> data = response.data;
       debugPrint('HERE IS THE RESPONSE.Data $data}');

       List<GetAllCharacters?> list = data.map((e)=>GetAllCharacters.fromJson(e as Map<String,dynamic>)).toList();
       debugPrint("HERE IS THE LIST ${list.length}");
       return list;
     }else{
       throw Exception(response.statusMessage);
     }
    }catch(e){
      debugPrint(e.toString());
    }
    return [];
  }
  Future<List<GetAllEpisodes?>>getAllEpisodes()async{
    try{
     var response = await dio.request("$url/$episode",
       options: Options(
         method: 'GET',
       ),
     );

     if(response.statusCode == 200) {

       List<dynamic> data = response.data;
       debugPrint('HERE IS THE RESPONSE.Data $data}');

       List<GetAllEpisodes?> list = data.map((e)=>GetAllEpisodes.fromJson(e as Map<String,dynamic>)).toList();
       debugPrint("HERE IS THE LIST ${list.length}");
       return list;
     }else{
       throw Exception(response.statusMessage);
     }
    }catch(e){
      debugPrint(e.toString());
    }
    return [];
  }

  Future<List<GetAllLocations?>>getAllLocations()async{
    try{
     var response = await dio.request("$url/$location",
       options: Options(
         method: 'GET',
       ),
     );

     if(response.statusCode == 200) {

       List<dynamic> data = response.data;
       debugPrint('HERE IS THE RESPONSE.Data $data}');

       List<GetAllLocations?> list = data.map((e)=>GetAllLocations.fromJson(e as Map<String,dynamic>)).toList();
       debugPrint("HERE IS THE LIST ${list.length}");
       return list;
     }else{
       throw Exception(response.statusMessage);
     }
    }catch(e){
      debugPrint(e.toString());
    }
    return [];
  }

  Future<List<GetAllQuotes?>>getAllQuotes()async{
    try{
     var response = await dio.request("$url/$quote",
       options: Options(
         method: 'GET',
       ),
     );

     if(response.statusCode == 200) {

       List<dynamic> data = response.data;
       debugPrint('HERE IS THE RESPONSE.Data $data}');

       List<GetAllQuotes?> list = data.map((e)=>GetAllQuotes.fromJson(e as Map<String,dynamic>)).toList();
       debugPrint("HERE IS THE LIST ${list.length}");
       return list;
     }else{
       throw Exception(response.statusMessage);
     }
    }catch(e){
      debugPrint(e.toString());
    }
    return [];
  }


}