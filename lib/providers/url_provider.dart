import 'package:reserva_cancha/model/url_repository.dart';

class UrlProvider {
  final UrlRepository repository;

  UrlProvider({required this.repository});

  String canchaImageUrl(String relativeUrl) {
    return repository.canchaImageUrl(relativeUrl);
  }

  String complejoImageUrl(String relativeUrl) {
    return repository.complejoImageUrl(relativeUrl);
  }
}