import 'package:hms/store/models/category_model.dart';
import 'package:get/get.dart';
import 'package:hms/store/models/product_models.dart';
import 'package:hms/store/services/category_services.dart';

class CategoryController extends GetxController {
  var categoryNameList = <CategoryStorModel>[].obs;
  var categoryList = <ProductModels>[].obs;

  var isCatgeoryLoading = false.obs;
  var isAllCategory = false.obs;


  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
  var categoryName = await CategoryServices.getCategory();
    try {
      isCatgeoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCatgeoryLoading(false);
    }
  }

  getAllCategorys(String index) async {
    var item=
        await AllCategorySercvises.getAllCatehory(index);
    print(categoryList);
    categoryList.clear();
    try {
      isAllCategory(true);

      if (item.isNotEmpty) {

        categoryList.addAll(item);
      }
    } finally {
      isAllCategory(false);
    }
    update();

  }
//
//   getCategoryIndex(int index) async {
//     var categoryAllName = await getAllCategorys(categoryNameList[index]);
//
//     if (categoryAllName != null) {
//       categoryList.value = categoryAllName;
//     }
//   }
// }
}