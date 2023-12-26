import 'package:get/get.dart';
import 'package:aquafeed_app/src/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}