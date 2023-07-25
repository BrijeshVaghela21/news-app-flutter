import 'package:my_news/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categoryList = [];

  CategoryModel categoryModel = new CategoryModel();
  categoryModel.categoryName = "Bussiness";
  categoryModel.nameInUrl = "business";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/273250/pexels-photo-273250.jpeg?auto=compress&cs=tinysrgb&w=600";

  categoryList.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.nameInUrl = "entertainment";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=600";

  categoryList.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.nameInUrl = "general";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/5146450/pexels-photo-5146450.jpeg?auto=compress&cs=tinysrgb&w=600";

  categoryList.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.nameInUrl = "health";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/771149/pexels-photo-771149.jpeg?auto=compress&cs=tinysrgb&w=600";

  categoryList.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.nameInUrl = "science";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/2150/sky-space-dark-galaxy.jpg?auto=compress&cs=tinysrgb&w=600";

  categoryList.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sport";
  categoryModel.nameInUrl = "sports";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/927437/pexels-photo-927437.jpeg?auto=compress&cs=tinysrgb&w=600";

  categoryList.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.nameInUrl = "technology";
  categoryModel.imageUrl =
      "https://images.pexels.com/photos/841228/pexels-photo-841228.jpeg?auto=compress&cs=tinysrgb&w=600";

  categoryList.add(categoryModel);

  return categoryList;
}
