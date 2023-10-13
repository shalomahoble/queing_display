import 'package:get/get.dart';
import 'package:queing_display/controllers/listen_controller.dart';
import 'package:queing_display/controllers/login_controller.dart';
import 'package:queing_display/controllers/quein_controller.dart';
import 'package:queing_display/services/queing_service.dart';

class AllControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QueingService>(() => QueingService());
    Get.lazyPut<QueinController>(() => QueinController());
    Get.lazyPut<ListenController>(() => ListenController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
