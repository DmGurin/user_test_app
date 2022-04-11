import 'package:user_test_app/data/api_services.dart';
import 'package:user_test_app/data/models/user_model.dart';

class Repository {
  final apiServices = ApiServices();

  Future<List<UserModel>> getUserModel() async {
    var response = await apiServices.getUsers();
    return response;
  }
}