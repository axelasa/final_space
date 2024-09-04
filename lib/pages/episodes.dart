import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_space/bloc/episodes/get_all_episodes_bloc.dart';
import 'package:final_space/constats/base_url.dart';
import 'package:final_space/model/get_all_characters.dart';
import 'package:final_space/util/screen_title.dart';
import 'package:final_space/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage({super.key});

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  final CardSwiperController controller = CardSwiperController();
  static final customCacheManager = CacheManager(
    Config(
      'episodesKey',
      stalePeriod: const Duration(days: 30),
      maxNrOfCacheObjects: 300,
    ),
  );
  bool shouldShowAlert = false;
  bool shouldShowError = true;
  String alertMessage = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    BlocProvider.of<GetAllEpisodesBloc>(context)
        .add(const GetAllEpisodesInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Center(
              child: ScreenTitle(title: 'Episodes'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<GetAllEpisodesBloc, GetAllEpisodesState>(
              builder: (context, state) {
            if (state is GetAllEpisodesLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state is GetAllEpisodesFail) {
              giveErrorMessage(message: state.error.toString());
            }
            if (state is GetAllEpisodesSuccess) {
              List<GetAllEpisodes?> episodes = state.episodes;

              return Container(
                alignment: Alignment.center,
                height: 450,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                // Or any height that suits your layout
                child: CardSwiper(
                  controller: controller,
                  cardsCount: episodes.length,
                  onSwipe: _onSwipe,
                  onUndo: _onUndo,
                  numberOfCardsDisplayed: 5,
                  // backCardOffset: const Offset(40, 40),
                  padding: const EdgeInsets.all(24.0),
                  cardBuilder: (
                    context,
                    i,
                    horizontalThresholdPercentage,
                    verticalThresholdPercentage,
                  ) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: CachedNetworkImage(
                              cacheManager: customCacheManager,
                              imageUrl: episodes[i]!.imgUrl!,
                              progressIndicatorBuilder:
                                  (context, url, progress) =>
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'name: ${episodes[i]?.name ?? ''}',
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
                              'air date: ${episodes[i]?.airDate ?? ''}',
                              style: GoogleFonts.akshar(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'director: ${episodes[i]?.director ?? ''}',
                              style: GoogleFonts.akshar(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'writer: ${episodes[i]?.writer ?? ''}',
                              style: GoogleFonts.akshar(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      )),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
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
