import 'package:emoodie_music_app/core/common/view/page_under_construction.dart';
import 'package:emoodie_music_app/core/common/widget/custom_textformfield.dart';
import 'package:emoodie_music_app/core/common/widget/customer_text.dart';
import 'package:emoodie_music_app/core/resources/app_colors.dart';
import 'package:emoodie_music_app/core/resources/media_res.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/album.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/artist.dart';
import 'package:emoodie_music_app/src/dashboard/presentation/bloc/dashboard_cubit.dart';
import 'package:emoodie_music_app/src/dashboard/presentation/widget/album_widget.dart';
import 'package:emoodie_music_app/src/dashboard/presentation/widget/artist_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboadScreen extends StatefulWidget {
  const DashboadScreen({super.key});

  @override
  State<DashboadScreen> createState() => _DashboadScreenState();
}

class _DashboadScreenState extends State<DashboadScreen> {
  final TextEditingController _searchcontroller =
      TextEditingController(text: "");
  String? dataType;
  List<Album>? albumList;
  List<ArtistData>? artistList;

  void getDrugs() {
    context.read<DashboardCubit>().getAlbumList(param: '', type: 'Api');
  }

  @override
  void initState() {
    super.initState();
    dataType = 'Albums';
    getDrugs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomText(
                text: 'Search',
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                icon: const Icon(Icons.search),
                controller: _searchcontroller,
                hintText: 'Artists, albums....',
                onChanged: (value) {
                  if(dataType == 'Albums'){
                    context.read<DashboardCubit>().searchAlbumList(param: value.toString(), album: albumList!, type: 'search');
                  }
                  else{
                    context.read<DashboardCubit>().searchArtistList(param: value.toString(), artist: artistList!, type: 'search');
                  }
                  
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      _searchcontroller.clear();
                      context.read<DashboardCubit>().getAlbumList(param: '', type: 'api');
                      setState(() {
                        dataType = 'Albums';
                      });
                    },
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: dataType == 'Albums'
                              ? AppColors.successColorSwatch.shade600
                              : AppColors.transparentColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1,
                              color: AppColors.primaryColorSwatch.shade200)),
                      child: const Center(
                          child: CustomText(
                        text: 'Albums',
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      _searchcontroller.clear();
                      context.read<DashboardCubit>().getArtistList(param: '', type: 'api');
                      setState(() {
                        dataType = 'Artists';
                      });
                    },
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: dataType == 'Artists'
                              ? AppColors.successColorSwatch.shade600
                              : AppColors.transparentColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1,
                              color: AppColors.primaryColorSwatch.shade200)),
                      child: const Center(
                          child: CustomText(
                        text: 'Artists',
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              BlocConsumer<DashboardCubit, DashboardState>(
                  listener: (_, state) {},
                  builder: (context, state) {
                    if (state is DashboardLoading) {
                      return Expanded(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                MediaRes.loading,
                                height: 40,
                                width: 50,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const CustomText(
                                text: 'Processing',
                                fontSize: 14,
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    if (state is DashboardFetchAlbum) {
                      albumList = state.album;
                      List<Album>? albumListdata = state.type == 'Api' ? state.album : state.filteredAlbums;

                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, index) {
                            return AlbumWidget(album: albumListdata[index]);
                          },
                          itemCount: albumListdata.length,
                          padding: const EdgeInsets.all(10),
                        ),
                      );
                    }
                    if (state is DashboardFetchArtist) {
                      artistList = state.artist;

                      return Expanded(
                        child: ListView.builder(
                            itemCount: state.type == 'Api' ? state.artist.length : state.filteredArtists.length,
                            itemBuilder: (context, index) {
                              return ArtistWidget(
                                  artistData: state.type == 'Api' ? state.artist[index] : state.filteredArtists[index]);
                            }),
                      );
                    }
                    return const PageUnderConstruction();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
