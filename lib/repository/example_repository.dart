import 'package:mini_app/data/data_state.dart';
import 'package:mini_app/model/products_response.dart';
import 'package:mini_app/service/api_service.dart';

class ExampleRepository {
  final ApiService _service = ApiService();

  Future<DataState<ProductTotalResponse?>> getRecipes() async {
    final result = await _service.fetchRecipes(currentSize: 10, skipSize: 10);
    if (result != null) {
      return Success(data: result);
    } else {
      return Failure(
        data: null,
      );
    }
  }
}
