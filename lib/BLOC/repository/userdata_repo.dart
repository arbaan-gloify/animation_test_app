import 'package:animation_test_app/BLOC/model/user_model.dart';
import 'package:animation_test_app/BLOC/service/user_data_services.dart';

class ApiRepository {
  final _api = Api();
  Future<UserDataModel> repaApi() async {
    return _api.getApi();
  }
}

class NetworkError extends Error {}
