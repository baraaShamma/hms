import 'package:hms/utils/my_string.dart';
import 'package:hms/view/widgets/dialog/success_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:hms/store/models/product_models.dart';
import 'package:hms/store/utils/my_string.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl2/all_products.php'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }

  static Future addOrderUser(context, String id_user, String id_product,
      String quantity, String price) async {
    var data = {
      "id_user": id_user.toString(),
      "id_product": id_product,
      "quantity": quantity,
      "price": price
    };
    var response = await http
        .post(Uri.parse('$baseUrl/store/order/add_order_user.php'), body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
    } else {
      return throw Exception("Failed to load addOrderUser");
    }
  }

  static Future addOrderDoctor(context, String id_doctor, String id_product,
      String quantity, String price) async {
    var data = {
      "id_doctor": id_doctor.toString(),
      "id_product": id_product,
      "quantity": quantity,
      "price": price
    };
    var response = await http
        .post(Uri.parse('$baseUrl/store/order/add_order_doctor.php'), body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
    } else {
      return throw Exception("Failed to load addOrderUser");
    }
  }
}
