import 'package:get/get.dart';
import 'package:queing_display/controllers/quein_controller.dart';
import 'package:queing_display/services/queing_service.dart';

class AllControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QueingService>(() => QueingService());
    Get.lazyPut<QueinController>(() => QueinController());
  }
}
