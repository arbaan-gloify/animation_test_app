import 'package:animation_test_app/BLOC/constant/uri_constant.dart';
import 'package:animation_test_app/BLOC/model/user_model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<UserDataModel> getApi() async {
    Uri url = Uri.parse(UserApi.userDataApi);
    final client = http.Client();
    final response = await client.get(url);
    if (response.statusCode == 200) {
      client.close();
      return welcomeFromJson(response.body);
    } else {
      client.close();
      throw Exception("Something Went Wrong");
    }
  }
}
