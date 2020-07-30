import '../models/Category.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();

  CategoryModel newcategory;
  newcategory = new CategoryModel();
  newcategory.categoryName = "Business";
  newcategory.imageUrl =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  category.add(newcategory);

  //2
  newcategory = new CategoryModel();
  newcategory.categoryName = "Entertainment";
  newcategory.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(newcategory);

  //3
  newcategory = new CategoryModel();
  newcategory.categoryName = "General";
  newcategory.imageUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  category.add(newcategory);

  //4
  newcategory = new CategoryModel();
  newcategory.categoryName = "Health";
  newcategory.imageUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  category.add(newcategory);

  //5
  newcategory = new CategoryModel();
  newcategory.categoryName = "Science";
  newcategory.imageUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  category.add(newcategory);

  //5
  newcategory = new CategoryModel();
  newcategory.categoryName = "Sports";
  newcategory.imageUrl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.add(newcategory);

  //5
  newcategory = new CategoryModel();
  newcategory.categoryName = "Technology";
  newcategory.imageUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(newcategory);

  return category;
}
