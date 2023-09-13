import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:queing_display/utils/utils.dart';

class QueingService extends GetConnect {
  final box = GetStorage();
  //Recuperer tous les directions
  Future<Response> getAllDirectons() async => await get(getUrl('directions'));

  //Recuperer tous les sites d'une direction
  Future<Response> getAllSites(int idDirection) async => await get(
        getUrl("directions/$idDirection"),
      );

  //Recuperer tous les tickets d'un site
  Future<Response> getAllTicket() async {
    final siteId = box.read("site");
    return await get(getUrl('url $siteId'));
  }
}
