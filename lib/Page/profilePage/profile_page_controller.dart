import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rusconsign/Api/all_profile_response.dart';
import 'package:rusconsign/Api/profile_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfilePageController extends GetxController {
  final currentIndex = 0.obs;
  final _selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool successfulRegister = false.obs;

  var detailProfile = Rxn<Profilee>();

  int get selectedIndex => _selectedIndex.value;

  void updateCurrentIndexIndicator(int index) {
    currentIndex.value = index;
  }



  Future<void> fetchProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var response = await http.get(
        Uri.parse("https://rusconsign.com/api/allprofile"),
        headers: {"Authorization": "Bearer ${token.toString()}"});
  
    if (response.statusCode == 200) {
      Profilee allProfile = profileFromJson(response.body);
      detailProfile.value = allProfile.profiles as Profilee?;
    } else {
      print("Eror Fetch DataProfile${response.statusCode}");
    }
  }

  void setSelectedFilter(int index) {
    _selectedIndex.value = index;
    update();
    _selectedIndex.refresh();
  }
}
