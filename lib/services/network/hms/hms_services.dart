import 'package:hms/model/hms/doctore_model.dart';
import 'package:hms/model/hms/home/advertising_model.dart';
import 'package:hms/model/hms/home/articles_model.dart';
import 'package:hms/model/hms/home/categories_model.dart';
import 'package:hms/utils/my_string.dart';
import 'package:http/http.dart' as http;

class HmsServices {
  static Future<List<CategoriesModel>> getCategories() async {
    var response =
        await http.get(Uri.parse('$baseUrl/main_page/categories.php'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoriesModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load categories");
    }
  }
  static Future<List<AdvertisingModel>> getAdvertising() async {
    var response =
    await http.get(Uri.parse('$baseUrl/main_page/advertising.php'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return advertisingModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load categories");
    }
  }
  static Future<List<ArticlesModel>> getArticles() async {
    var response =
    await http.get(Uri.parse('$baseUrl/main_page/articles.php'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return articlesModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load articles");
    }
  }

  static Future<List<DoctoreModel>> getDoctores(String id_categorie) async {
    var data = {"id_categorie": id_categorie.toString()};
    var response = await http.post(
        Uri.parse('$baseUrl/main_page/view_doctors/doctores.php'),
        body: data);

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return doctoreModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load categories");
    }
  }
}
