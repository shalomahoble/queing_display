import 'package:get/get.dart';
import 'package:queing_display/utils/utils.dart';

class QueingService extends GetConnect {
  //Recuperer tous les directions
  Future<Response> getAllDirectons() async => await get(getUrl('directions'));

  //Recuperer tous les sites d'une direction
  Future<Response> getAllSites(int idDirection) async => await get(
        getUrl("directions/$idDirection"),
      );

  //Recuperer tous les tickets d'un site
  Future<Response> getAllTicket() async => await get(getUrl('url'));
}
