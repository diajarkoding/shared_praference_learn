import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxInt count = 0.obs;

  void increment() {
    count++;
    simpanData();
  }

  void decrement() {
    count--;
    simpanData();
  }

  void simpanData() async {
    print('Simpan Data');
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('counter') != null) {
      await prefs.remove('counter');
    }
    await prefs.setInt('counter', count.value);
  }

  void bacaData() async {
    print('Baca Data');
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('counter') != null) {
      count.value = prefs.getInt('counter')!;
    }
  }

  void resetData() async {
    print('Reset Data');
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('counter') != null) {
      await prefs.remove('counter');
      count.value = 0;
    }
  }

  @override
  void onInit() {
    bacaData();
    super.onInit();
  }
}
