import 'package:emoodie_music_app/core/common/widget/customer_text.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/artist.dart';
import 'package:flutter/material.dart';

class ArtistWidget extends StatefulWidget {
  const ArtistWidget({super.key, required this.artistData});

  final ArtistData? artistData;

  @override
  State<ArtistWidget> createState() => _ArtistWidgetState();
}

class _ArtistWidgetState extends State<ArtistWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              widget.artistData!.images[0].url,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CustomText(
            text: widget.artistData!.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ],
      ),
    );
  }
}