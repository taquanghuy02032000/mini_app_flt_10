import 'package:get/get.dart';
import 'package:mini_app/data/data_state.dart';
import 'package:mini_app/model/products_response.dart';
import 'package:mini_app/repository/example_repository.dart';
import 'package:mini_app/service/api_service.dart';

class ListProductController extends GetxController {
  List<ProductModel> products = <ProductModel>[].obs;
  RxBool loadingAll = false.obs;
  RxBool loadingList = false.obs;
  RxString errorMessage = ''.obs;

  final ExampleRepository _repo = ExampleRepository();

  final ApiService service = ApiService();

  int pageSize = 4;
  int skipSize = 0;
  int? totalSize;

  Future<void> getExampleData() async {
    loadingAll.value = true;
    final result = await _repo.getRecipes();
    if (result is Failure) {
      result as Failure;
      errorMessage.value = 'Somethingwent wrong';
    } else {
      //Error
      result as Success;
      // products = result.data ?....;
    }
  }

  Future<void> getRecipes({
    bool isLoadMore = false,
  }) async {
    if (products.isEmpty) {
      loadingAll.value = true;
    }
    if (isLoadMore) {
      loadingList.value = true;
      skipSize += 4;
    }

    final ProductTotalResponse? response = await service.fetchRecipes(
      currentSize: pageSize,
      skipSize: skipSize,
    );
    if (pageSize == 4) {
      loadingAll.value = false;
    }
    if (isLoadMore) {
      loadingList.value = false;
    }
    if (response == null) {
      Get.snackbar('Error Loading data!', ':((');
    } else {
      totalSize = response.totalResults ?? 0;
      products.addAll(response.results ?? []);
    }
    print('products ${products.length}');
  }

  Future<void> loadMore() async {
    if (products.length < (totalSize ?? 0)) {
      await getRecipes(isLoadMore: true);
    } else {
      // == || >
      //nothing
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getRecipes();
  }
}
