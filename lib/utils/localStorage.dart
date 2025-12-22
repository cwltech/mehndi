import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxController {
  RxString userid = "".obs;
  RxString userid2 = "".obs;
  RxString userName = "".obs;
  RxString userEmail = "".obs;
  RxString otp = "".obs;
  RxString token = "".obs;
  RxString notiToken = "".obs;
  RxList localArray = [].obs;

  setUserId(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("userIds", id);
  }

  getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userid.value = pref.getString("userIds")!;
    return userid.value;
  }

  saveNotification(String noti) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("noti", noti);
  }

  getNotiifcation() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    notiToken.value = pref.getString("noti")!;
    return notiToken.value;
  }

  setUserId2(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("userId2", id);
  }

  getUserId2() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userid2.value = pref.getString("userId2")!;
    return userid2.value;
  }

  setArray(String id, String questionId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList("idArray", [id, questionId]);
  }

  getArray() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    localArray.value = pref.getStringList("idArray")!;
    print("local array");
    print(localArray);

    return localArray;
  }

  setOtp(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("otp", id);
  }

  getOtp() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    otp.value = pref.getString("otp")!;

    return otp.value;
  }

  Future setName(String name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", name);
  }

  getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userName.value = pref.getString("name")!;
    return userName.value;
  }

  Future setEmail(String email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", email);
  }

  getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userEmail.value = pref.getString("email")!;
    return userEmail.value;
  }

  Future setToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", token);
  }

  Future getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token.value = pref.getString("token")!;
    return token.value;
  }

  deleteToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove("userId2");
  }

  @override
  void onReady() async {
    await getUserId();

    super.onReady();
  }
}
