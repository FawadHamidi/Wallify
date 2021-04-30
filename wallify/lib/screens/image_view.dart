import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;

  ImageView({this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  Future<void> setWallpaper() async {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imgUrl);
    String result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Hero(
          tag: widget.imgUrl,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              widget.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setWallpaper();
            Navigator.pop(context);
          },
          child: Center(
            child: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24, width: 1),
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Set as Wallpaper",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _save();
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 1.5),
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24, width: 1),
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                      colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Download",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }

  _save() async {
    var response = await Dio()
        .get(widget.imgUrl, options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }
}
