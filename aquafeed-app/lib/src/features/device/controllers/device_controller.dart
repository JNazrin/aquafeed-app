import 'package:aquafeed_app/src/data/repositories/device/device_repository.dart';
import 'package:aquafeed_app/src/utils/components/snackbar_widget.dart';
import 'package:get/get.dart';
import 'package:aquafeed_app/src/features/device/models/device_model.dart';

class DeviceController extends GetxController {
  static DeviceController get instance => Get.find();

  Rx<DeviceModel> device = DeviceModel.empty().obs;
  final deviceRepository = Get.put(DeviceRepository());

  @override
  void onInit() {
    super.onInit();
    fetchDeviceRecord();
  }

  void fetchDeviceRecord() async {
    try {
      final device = await deviceRepository.fetchDeviceRecord();
      device.assignAll(device);
    } catch(e) {
      SnackbarWidget.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}