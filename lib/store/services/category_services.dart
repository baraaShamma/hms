import 'package:http/http.dart' as http;
import 'package:hms/store/models/category_model.dart';
import 'package:hms/store/models/product_models.dart';
import 'package:hms/store/utils/my_string.dart';

class CategoryServices {
  static Future<List<CategoryStorModel>> getCategory() async {    print("-----555--");

  var response = await http.get(Uri.parse('$baseUrl2/categories_shop.php'));
    print("-------");
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryStorModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}

class AllCategorySercvises {
  static Future<List<ProductModels>> getAllCatehory(String idCat) async {
print("******6666");
    var data = {"idCat": idCat};
    var response = await http.post(
        Uri.parse('$baseUrl2/products.php'),
        body: data);
print("******77777766");

    if (response.statusCode == 200) {
      var jsonData = response.body;
      print("--------");
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
