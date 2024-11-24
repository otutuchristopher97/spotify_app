import 'package:emoodie_music_app/core/common/widget/customer_text.dart';
import 'package:emoodie_music_app/src/dashboard/domain/entities/album.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlbumWidget extends StatefulWidget {
  const AlbumWidget({super.key, required this.album});
  final Album? album;

  @override
  State<AlbumWidget> createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  
  String getYear(data) {
    DateTime parsedDate = DateTime.parse(data);
    String year = DateFormat('yyyy').format(parsedDate);

    return year;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.album!.images[0].url,
            height: 140,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomText(
            text: widget.album!.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomText(
            text: getYear(widget.album!.releaseDate),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
