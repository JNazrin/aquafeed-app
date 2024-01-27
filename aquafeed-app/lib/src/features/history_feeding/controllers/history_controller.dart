import 'package:aquafeed_app/src/data/repositories/history/history_repository.dart';
import 'package:aquafeed_app/src/features/history_feeding/models/history_model.dart';
import 'package:aquafeed_app/src/utils/components/snackbar_widget.dart';
import 'package:aquafeed_app/src/utils/helpers/network_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:aquafeed_app/src/data/repositories/authentication/authentication_repository.dart';

class HistoryController extends GetxController {
  static HistoryController get instance => Get.find();

  RxList<HistoryModel> listHistory = <HistoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHistoryRecord();
  }

  void fetchHistoryRecord() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        return;
      }

      List<HistoryModel> list = <HistoryModel>[];

      FirebaseFirestore.instance
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .collection("History")
          .snapshots()
          .listen((QuerySnapshot<Map<String, dynamic>> event){
         list.clear();
         for(var item in event.docs) {
           HistoryModel history = HistoryModel(
             dateFeed: item.get('dateFeed'),
             timeFeed: item.get('timeFeed'),
             id: item.id,
           );
           list.add(history);
         }
         listHistory.assignAll(list);
      });
    } catch(e) {
      SnackbarWidget.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  void deleteHistoryRecord({required String id}) async {
    final historyRepository = Get.put(HistoryRepository());

    await historyRepository.deleteHistoryRecord(id);

    SnackbarWidget.successSnackBar(title: 'Successfully delete history');
  }
}