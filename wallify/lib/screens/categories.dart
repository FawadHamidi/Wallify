import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallify/data/data.dart';
import 'package:wallify/models/wallpaper_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallify/screens/search.dart';
import 'package:wallify/widgets/brand_name.dart';
import 'package:wallify/widgets/wallpapers_widget.dart';

class CategoriesScreen extends StatefulWidget {
  final String categoryName;

  CategoriesScreen({this.categoryName});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  TextEditingController searchController = TextEditingController();
  List<WallpaperModel> wallpapers = [];
  getCategoryPhotos(String name) async {
    await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$name&per_page=500"),
        headers: {
          'Authorization': apiKey,
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData['photos'].forEach((element) {
        WallpaperModel wallpaperModel = WallpaperModel();
        wallpaperModel = WallpaperModel.fromJson(element);
        wallpapers.add(wallpaperModel);
      });
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getCategoryPhotos(widget.categoryName);
    searchController.text = widget.categoryName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: brandName(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(30)),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            labelText: 'Search', border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Search(
                              searchQuery: searchController.text,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
