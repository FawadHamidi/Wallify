import 'package:wallify/models/categories_model.dart';

String apiKey = '563492ad6f9170000100000109811b1472354c21a0869f828ce0907f';

List<CategoriesModel> getCategories() {
  CategoriesModel categoriesModel = CategoriesModel();
  List<CategoriesModel> categories = [];

  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.name = "Street Art";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.name = "Wild Life";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.name = "Nature";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.name = "City";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categoriesModel.name = "Motivation";

  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.name = "Bikes";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.name = "Cars";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  return categories;
}
