import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_space/bloc/characters/get_all_characters_bloc.dart';
import 'package:final_space/constats/base_url.dart';
import 'package:final_space/model/get_all_characters.dart';
import 'package:final_space/util/screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/app_color.dart';
import '../widgets/product_image.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {

  static final customCacheManager = CacheManager(
    Config(
      'characterKey',
      stalePeriod: const Duration(days: 30),
      maxNrOfCacheObjects: 300,
    ),
  );

  bool shouldShowAlert = false;
  bool shouldShowError = true;
  String alertMessage = '';

  @override
  void initState() {
    BlocProvider.of<GetAllCharactersBloc>(context).add(const GetAllCharactersInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: ScreenTitle(title: 'Final Space'),
            ),
            const SizedBox(height: 30,),
            shouldShowAlert
                ? shouldShowError
                ? Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.errorColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                alertMessage,
                style: GoogleFonts.akshar(
                  textStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ),
            )
                : Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.successColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                alertMessage,
                style: GoogleFonts.akshar(
                  textStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ),
            )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
           BlocBuilder<GetAllCharactersBloc,GetAllCharactersState>(builder: (context,state){
             if(state is GetAllCharactersLoading){
               return const Center(
                 child: CircularProgressIndicator.adaptive(),
               );
             }
             if(state is GetAllCharactersFail){
               giveErrorMessage(message: '${state.error}');
             }
             if(state is GetAllCharactersSuccess){
               List <GetAllCharacters?>response = state.characters;

               return Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all( 8.0),
                   child: GridView.builder(
                     //shrinkWrap: true,
                     itemCount: response.length,
                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                           crossAxisSpacing: 5,
                           childAspectRatio: 1,
                       ),
                       itemBuilder: (_,i){

                       return Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Expanded(
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(10.0),
                                 child: CachedNetworkImage(
                                   cacheManager: customCacheManager,
                                   imageUrl: response[i]!.imgUrl!,
                                   progressIndicatorBuilder: (context, url, progress) =>
                                   const CircularProgressIndicator.adaptive(),
                                   errorWidget: (context, url, error) => const Center(
                                     child: Icon(
                                       Icons.error,
                                       color: Colors.red,
                                       size: 180,
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                             const SizedBox(height: 10,),
                             Text('name:${response[i]?.name ?? ''}',maxLines: 1,
                               overflow: TextOverflow.ellipsis,),
                             const SizedBox(height: 3,),
                             Text('species: ${response[i]?.species ?? ''}',maxLines: 1,
                               overflow: TextOverflow.ellipsis,)
                           ],
                         ),
                       );
                       }),
                 ),
               );
             }
             return const SizedBox.shrink();
           },),
          ],
        ),
         // child:BlocBuilder(builder: builder)<>
      ),
    );
  }

  void giveErrorMessage({required String message}) {
    setState(() {
      shouldShowAlert = true;
      shouldShowError = true;
      alertMessage = message;
      Future.delayed(const Duration(seconds: 1000));
    });
  }

  void giveSuccessMessage({required String message}) {
    setState(() {
      shouldShowAlert = true;
      shouldShowError = false;
      alertMessage = message;
      Future.delayed(const Duration(seconds: 1000));
    });
  }
}
