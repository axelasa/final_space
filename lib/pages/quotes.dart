import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_space/bloc/quotes/get_all_quotes_bloc.dart';
import 'package:final_space/model/get_all_characters.dart';
import 'package:final_space/util/screen_title.dart';
import 'package:final_space/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {

  static final customCacheManager = CacheManager(
    Config(
      'quotesKey',
      stalePeriod: const Duration(days: 30),
      maxNrOfCacheObjects: 300,
    ),
  );
  
  bool shouldShowAlert = false;
  bool shouldShowError = true;
  String alertMessage = '';

  @override
  void initState() {
  BlocProvider.of<GetAllQuotesBloc>(context).add(const GetAllQuotesInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding:  EdgeInsets.symmetric(vertical: 20,),
                child:  Center(
                  child:  ScreenTitle(title: 'Quotes'),
                ),
              ),
              const SizedBox(height: 20,),
              BlocBuilder<GetAllQuotesBloc,GetAllQuotesState>(builder: (
              context,state){
                if(State is GetAllQuotesLoading){
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if(state is GetAllQuotesFail){
                  giveErrorMessage(message:state.error.toString());
                }
                if(state is GetAllQuotesSuccess){
                  List <GetAllQuotes?> quote = state.quotes;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 58.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider.builder(
                          itemCount: quote.length,
                          itemBuilder: (context, i, pageViewIndex) => SizedBox(
                            height: 600,
                            child: GestureDetector(
                              onTap: (){
                                showModalBottomSheet(
                                    context: context, builder: (BuildContext context){
                                   return SizedBox(
                                     height: 800,
                                     child: Column(
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.only(bottom: 8.0),
                                           child: ClipRRect(
                                             borderRadius: BorderRadius.circular(10.0),
                                             child: ProductImage(
                                               url: quote[i]!.image!,
                                             ),
                                           ),
                                         ),
                                         const SizedBox(height: 10,),
                                         Padding(
                                           padding: const EdgeInsets.only(bottom: 8.0),
                                           child: Text(
                                             'quote by: ${quote[i]?.by ?? ''}',
                                             style: GoogleFonts.akshar(
                                               textStyle: const TextStyle(
                                                 color: Colors.black,
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.w600,
                                               ),
                                             ),
                                           ),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Text(
                                             'quote: ${quote[i]?.quote ?? ''}',
                                             style: GoogleFonts.akshar(
                                               textStyle: const TextStyle(
                                                 color: Colors.black,
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.w500,
                                               ),
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   );
                                }
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: CachedNetworkImage(
                                      cacheManager: customCacheManager,
                                      imageUrl: quote[i]!.image!,
                                      progressIndicatorBuilder: (context, url, progress) =>
                                      const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => const Center(
                                        child: Icon(
                                          Icons.error,
                                          color: Colors.red,
                                          size: 180,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          options: CarouselOptions(
                            height: 360,
                            reverse: false,
                            autoPlay: false,
                            autoPlayInterval: const Duration(seconds: 2),
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            //viewportFraction:1,
                            //aspectRatio: 2.0,
                            initialPage: 0,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
              )
            ],
          ),
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
