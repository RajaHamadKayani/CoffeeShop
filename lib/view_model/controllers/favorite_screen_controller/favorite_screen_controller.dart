import 'package:get/get.dart';

class FavoriteScreenController extends GetxController {
  RxBool loading = false.obs;
  void isLoading() {
    loading.value = !loading.value;
  }
}
