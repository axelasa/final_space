import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_space/bloc/locations/get_all_locations_bloc.dart';
import 'package:final_space/model/get_all_characters.dart';
import 'package:final_space/util/screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
class LocationsPage extends StatefulWidget {
  const LocationsPage({super.key});

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  static final customCacheManager = CacheManager(
    Config(
      'locationsKey',
      stalePeriod: const Duration(days: 30),
      maxNrOfCacheObjects: 300,
    ),
  );

  bool shouldShowAlert = false;
  bool shouldShowError = true;
  String alertMessage = '';
  bool isSwitched = false;


  @override
  void initState() {
    BlocProvider.of<GetAllLocationsBloc>(context).add(const GetAllLocationsInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView( // Add this
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(28.0),
                child: Center(child: ScreenTitle(title: 'Locations')),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Rotate",
                      style: GoogleFonts.akshar(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Switch(
                        value: isSwitched,
                        onChanged: (value){
                          setState(() {
                            isSwitched = value;
                          });
                        },
                    )
                  ],
                ),
              ),

              BlocBuilder<GetAllLocationsBloc, GetAllLocationsState>(
                builder: (context, state) {
                  if (state is GetAllLocationsLoading) {
                    return const Center(child: CircularProgressIndicator.adaptive(),);
                  }
                  if (state is GetAllLocationsFail) {
                    giveErrorMessage(message: state.error.toString());
                  }
                  if (state is GetAllLocationsSuccess) {
                    final List<GetAllLocations?> location = state.locations;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 58.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider.builder(
                            itemCount: location.length,
                            itemBuilder: (context, i, pageViewIndex) => SizedBox(
                              height: 600,
                              child: Card(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10,),
                                elevation: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: CachedNetworkImage(
                                        cacheManager: customCacheManager,
                                        imageUrl: location[i]!.imgUrl!,
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
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'name: ${location[i]?.name ?? ''}',
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
                                        'type: ${location[i]?.type ?? ''}',
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
                              ),
                            ),
                            options: CarouselOptions(
                              height: 350,
                              reverse: false,
                              autoPlay: isSwitched,
                              autoPlayInterval: const Duration(seconds: 2),
                              enlargeCenterPage: true,
                              enlargeFactor: 0.19,
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
              ),
            ],
          ),
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
