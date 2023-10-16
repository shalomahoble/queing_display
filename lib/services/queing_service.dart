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
      ).timeout(const Duration(minutes: 2), onTimeout: () {
        return const Response(
            statusCode: 404, body: "Vérifier votre connexion internet");
      });

  //Recuperer tous les tickets d'un site
  Future<Response> getAllTicket() async {
    final siteId = box.read("site");
    if (siteId == null) {
      return const Response(statusCode: 400, body: null);
    } else {
      final response = await get(getUrl('site/$siteId/tickets'));
      return response;
    }
  }

  //Recuperer tous les tickets d'un site
  Future<Response> loginTv(
      {required String code, required String password}) async {
    return await post(getUrl('site/tv'), <String, dynamic>{
      'code': code,
      'password': password,
    }).timeout(
      const Duration(minutes: 4),
      onTimeout: () => const Response(
        statusCode: 400,
        body: "Connexion impossible",
      ),
    );
  }

  //Recuperer les arlertes
  Future<Response> getAllAlerte() async => await get(
        getUrl("get-all-alerte/tv"),
      ).timeout(
        const Duration(minutes: 4),
        onTimeout: () =>
            const Response(statusCode: 400, body: "Connexion impossible"),
      );
}
